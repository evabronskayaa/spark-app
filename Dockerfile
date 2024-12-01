FROM apache/spark-py:v3.4.0

USER root

RUN pip install poetry

COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

COPY . .

RUN chmod -R 777 /opt/spark/work-dir