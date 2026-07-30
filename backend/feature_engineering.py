import numpy as np
import pandas as pd


def safe_div(a, b):

    return a / b if b != 0 else 0.0




def prepare_features(company, feature_columns):
    df = pd.DataFrame([company])

    at = df.loc[0, "at"]
    sale = df.loc[0, "sale"]
    ni = df.loc[0, "ni"]

    dlc = df.loc[0, "dlc"]
    dltt = df.loc[0, "dltt"]

    che = df.loc[0, "che"]
    ppent = df.loc[0, "ppent"]
    capx = df.loc[0, "capx"]

    cogs = df.loc[0, "cogs"]
    invt = df.loc[0, "invt"]

    oancf = df.loc[0, "oancf"]

    ceq = df.loc[0, "ceq"]

    prcc_f = df.loc[0, "prcc_f"]
    csho = df.loc[0, "csho"]

    df["ln_at"] = np.log(max(at, 1e-8))

    df["profitability"] = safe_div(
        ni,
        at
    )

    df["leverage"] = safe_div(
        dltt + dlc,
        at
    )

    df["cash_holdings"] = safe_div(
        che,
        at
    )

    df["tangibility"] = safe_div(
        ppent,
        at
    )

    df["capex"] = safe_div(
        capx,
        at
    )

    df["cashflow_margin"] = safe_div(
        oancf,
        sale
    )

    df["inventory_turnover"] = safe_div(
        cogs,
        invt
    )

    df["equity_ratio"] = safe_div(
        ceq,
        at
    )

    df["market_value"] = (
        prcc_f * csho
    )
    df = df[feature_columns]

    return df

