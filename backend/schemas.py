from pydantic import BaseModel

class CompanyInput(BaseModel):

    sale: float
    xad: float
    xsga: float
    xrd: float

    at: float
    ni: float

    rect: float
    che: float

    dlc: float
    dltt: float

    ppent: float
    capx: float

    ceq: float

    emp: float

    invt: float
    cogs: float

    oancf: float

    prcc_f: float
    csho: float