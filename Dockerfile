FROM python:3.13.7-alpine3.22 AS builder

RUN apk add --no-cache gcc musl-dev linux-headers
WORKDIR /app
COPY requirements.txt .
RUN pip install --prefix=/install --no-cache-dir --require-hashes -r requirements.txt

FROM python:3.13.7-alpine3.22

WORKDIR /app
COPY --from=builder /install /usr/local
COPY app.py .
EXPOSE 5000
CMD ["gunicorn", "-w", "1", "-b", "0.0.0.0:5000", "app:app"]
