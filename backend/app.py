from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI

from schemas import CompanyInput

from predictor import predict
from optimizer import analyze
from optimizer import optimize
app = FastAPI(
    title="Marketing AI API",
    version="1.0"
)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],

    allow_credentials=False,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def home():
    return {
        "status": "Running",
        "message": "Marketing AI API is running successfully."
    }


@app.post("/predict")
def predict_company(company: CompanyInput):

    prediction = predict(company.model_dump())

    return {
        "marketing_efficiency": prediction
    }


@app.post("/optimize")
def optimize_company(company: CompanyInput):

    return optimize(company.model_dump())


@app.post("/analyze")
def analyze_company(company: CompanyInput):

    return analyze(
        company.model_dump()
    )