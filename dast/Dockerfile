FROM python:3.9-slim as builder

WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc g++ make libssl-dev libffi-dev

COPY requirements.txt .
COPY headers.txt .
COPY headers-large.txt .
COPY log4j-scan.py .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt


# final stage
FROM python:3.9-slim
WORKDIR /app
COPY --from=builder /app/wheels /wheels
COPY --from=builder /app/requirements.txt .
COPY --from=builder /app/headers.txt .
COPY --from=builder /app/headers-large.txt .
COPY --from=builder /app/log4j-scan.py .
RUN pip install --no-cache /wheels/*

ENTRYPOINT ["python", "log4j-scan.py" ]