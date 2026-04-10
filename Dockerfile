FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir \
    fastapi==0.111.0 \
    uvicorn==0.30.1 \
    requests==2.31.0 \
    pandas==2.1.4 \
    numpy==1.26.4 \
    xgboost==2.0.3 \
    scikit-learn==1.4.2 \
    python-dotenv==1.0.1 \
    pydantic==2.7.1 \
    pydantic-settings==2.3.0 \
    joblib==1.4.2 \
    loguru==0.7.2

COPY . .
RUN python main.py train

EXPOSE 10000
CMD ["python", "-m", "uvicorn", "api:app", "--host", "0.0.0.0", "--port", "10000"]
