FROM python:3.11-slim
WORKDIR /app
COPY pyproject.toml .
RUN pip install --no-cache-dir -e "."
COPY src/ src/
COPY models/ models/
RUN adduser --disabled-password --gecos "" appuser
USER appuser
EXPOSE 8000
CMD ["uvicorn", "src.loan_default.api.app:app", "--host", "0.0.0.0", "--port", "8000"]
