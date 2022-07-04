FROM python:3.10-slim-bullseye as builder

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --no-cache-dir --no-deps --upgrade pip setuptools wheel

COPY requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt

FROM python:3.10-slim-bullseye

WORKDIR /app

COPY --from=builder /app/wheels /wheels

RUN pip install --no-cache /wheels/*

COPY scrapyd.conf /etc/scrapyd/

EXPOSE 6800

CMD ["scrapyd"]