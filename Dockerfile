FROM python:3.12-slim
WORKDIR /dbt

RUN apt-get update && apt-get install -y wget unzip git

RUN wget https://github.com/duckdb/duckdb/releases/download/v1.0.0/duckdb_cli-linux-amd64.zip
RUN unzip duckdb_cli-linux-amd64.zip

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY packages.yml .
COPY dbt_project.yml .
RUN dbt deps
