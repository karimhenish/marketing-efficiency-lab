import joblib
import numpy as np
import pandas as pd

from catboost import CatBoostRegressor

from feature_engineering import prepare_features

import joblib

from catboost import CatBoostRegressor

from feature_engineering import prepare_features

model = CatBoostRegressor()

model.load_model(
    "models/marketing_efficiency_model.cbm"
)

feature_columns = joblib.load(
    "models/feature_columns.pkl"
)


def predict(company):

    df = prepare_features(
        company,
        feature_columns
    )

    prediction = model.predict(df)[0]

    return float(prediction)



