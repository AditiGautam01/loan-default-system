"""
Central configuration — all settings loaded from .env
Usage: from loan_default.config import settings
"""
from pydantic_settings import BaseSettings
from pathlib import Path


class Settings(BaseSettings):
    db_url: str                  = "sqlite:///loan_db.sqlite"
    model_path: str              = "models/loan_model.pkl"
    threshold: float             = 0.6
    anthropic_api_key: str       = ""
    mlflow_tracking_uri: str     = "http://localhost:5000"
    mlflow_experiment_name: str  = "loan-default"
    log_level: str               = "INFO"
    env: str                     = "development"
    data_dir: str                = "data/raw"
    chunk_size: int              = 50_000

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"


settings = Settings()

# Ensure key directories exist at import time
for d in ["models", "logs", "data/raw", "data/processed"]:
    Path(d).mkdir(parents=True, exist_ok=True)
