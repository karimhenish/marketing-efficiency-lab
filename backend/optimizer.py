import copy
import joblib
import numpy as np
import optuna

from catboost import CatBoostRegressor
from feature_engineering import prepare_features

# Load Model
model = CatBoostRegressor()
model.load_model("models/marketing_efficiency_model.cbm")

# Load Supporting Files
feature_columns = joblib.load("models/feature_columns.pkl")
search_space = joblib.load("models/search_space.pkl")
typical_change = joblib.load("models/typical_change.pkl")
ratio_limits = joblib.load("models/ratio_limits.pkl")

optimizable_features = [
    "xad",
    "xsga",
    "xrd",
    "rect",
    "che",
    "capx",
    "emp",
    "invt",
    "cogs",
    "oancf"
]


def optimize(company):

    company = prepare_features(
        company,
        feature_columns
    )

    def objective(trial):

        temp = company.copy()

        # =====================================
        # Generate Candidate Values
        # =====================================

        for feature in optimizable_features:

            current = float(company.iloc[0][feature])

            change = typical_change[feature]

            if current <= 1e-8:

                lower = max(
                    0.0,
                    search_space[feature]["min"]
                )

                upper = max(
                    lower + 1e-6,
                    search_space[feature]["median"]
                )

            else:

                lower = current * (1 - change)
                upper = current * (1 + change)

                lower = max(
                    lower,
                    search_space[feature]["min"]
                )

                upper = min(
                    upper,
                    search_space[feature]["max"]
                )

                lower = max(lower, 0.0)

            if lower >= upper:

                lower = max(
                    0.0,
                    search_space[feature]["min"]
                )

                upper = max(
                    lower + 1e-6,
                    search_space[feature]["max"]
                )

            temp.loc[
                temp.index[0],
                feature
            ] = trial.suggest_float(
                feature,
                lower,
                upper
            )

        # =====================================
        # Read Variables
        # =====================================

        at = temp.iloc[0]["at"]
        sale = temp.iloc[0]["sale"]
        ni = temp.iloc[0]["ni"]

        dlc = temp.iloc[0]["dlc"]
        dltt = temp.iloc[0]["dltt"]

        che = temp.iloc[0]["che"]
        ppent = temp.iloc[0]["ppent"]
        capx = temp.iloc[0]["capx"]

        cogs = temp.iloc[0]["cogs"]
        invt = temp.iloc[0]["invt"]

        oancf = temp.iloc[0]["oancf"]

        ceq = temp.iloc[0]["ceq"]

        prcc_f = temp.iloc[0]["prcc_f"]
        csho = temp.iloc[0]["csho"]

        xad = temp.iloc[0]["xad"]
        xsga = temp.iloc[0]["xsga"]
        xrd = temp.iloc[0]["xrd"]
        rect = temp.iloc[0]["rect"]

        # =====================================
        # Derived Features
        # =====================================

        temp.loc[temp.index[0], "ln_at"] = np.log(max(at, 1e-8))

        temp.loc[temp.index[0], "profitability"] = ni / at if at != 0 else 0

        temp.loc[temp.index[0], "leverage"] = (dltt + dlc) / at if at != 0 else 0

        temp.loc[temp.index[0], "cash_holdings"] = che / at if at != 0 else 0

        temp.loc[temp.index[0], "tangibility"] = ppent / at if at != 0 else 0

        temp.loc[temp.index[0], "capex"] = capx / at if at != 0 else 0

        temp.loc[temp.index[0], "cashflow_margin"] = oancf / sale if sale != 0 else 0

        temp.loc[temp.index[0], "inventory_turnover"] = cogs / invt if invt != 0 else 0

        temp.loc[temp.index[0], "equity_ratio"] = ceq / at if at != 0 else 0

        temp.loc[temp.index[0], "market_value"] = prcc_f * csho

        # =====================================
        # Business Ratios
        # =====================================

        business_ratios = {

            "xad": xad / sale if sale != 0 else 0,

            "xsga": xsga / sale if sale != 0 else 0,

            "xrd": xrd / sale if sale != 0 else 0,

            "rect": rect / sale if sale != 0 else 0,

            "che": che / at if at != 0 else 0,

            "capx": capx / at if at != 0 else 0,

            "cogs": cogs / sale if sale != 0 else 0,

            "oancf": oancf / sale if sale != 0 else 0,

            "invt": invt / sale if sale != 0 else 0

        }

        # =====================================
        # Business Constraints
        # =====================================

        for feature, ratio in business_ratios.items():

            limits = ratio_limits[feature]

            if ratio < limits["p5"]:
                raise optuna.TrialPruned()
            if ratio > limits["p95"]:
                raise optuna.TrialPruned()

        # =====================================
        # Prediction
        # =====================================
        #print(temp.T)
        prediction = model.predict(temp)[0]

        trial.set_user_attr(
            "prediction",
            float(prediction)
        )

        return prediction

    # =====================================
    # Run Optimization
    # =====================================
    sampler = optuna.samplers.TPESampler(seed=42)
    study = optuna.create_study(
        direction="maximize",
        sampler=sampler

    )
    print("OPTIMIZER VERSION 2")
    
    study.optimize(
        objective,
        n_trials=1
    )
    print("OPTIMIZATION DONE")
    # =====================================
    # Final Results
    # =====================================

    current_prediction = model.predict(company)[0]

    best_prediction = study.best_value
    best_params = study.best_params

    if best_prediction <= current_prediction:
        optimized_prediction = current_prediction
        improvement = 0.0
        recommended_values = {}
    else:
        optimized_prediction = best_prediction
        improvement = (
            (optimized_prediction - current_prediction)
            / current_prediction
        ) * 100
        recommended_values = best_params

    return {
        "current_prediction": float(current_prediction),
        "optimized_prediction": float(optimized_prediction),
        "improvement_percent": float(improvement),
        "recommended_values": recommended_values
}
        



def analyze(company):

    # Prediction الحالية
    company_df = prepare_features(
        company,
        feature_columns
    )

    current_prediction = model.predict(company_df)[0]

    # Optimization
    optimization = optimize(company)

    return {

        "current_prediction": float(current_prediction),

        "optimized_prediction": optimization["optimized_prediction"],

        "improvement_percent": optimization["improvement_percent"],

        "recommended_values": optimization["recommended_values"]

    }