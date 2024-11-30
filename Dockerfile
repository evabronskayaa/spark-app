FROM apache/spark-py:v3.4.0

USER root

RUN pip install poetry

COPY pyproject.toml poetry.lock ./

ENV POETRY_VIRTUALENVS_IN_PROJECT=false
ENV POETRY_VIRTUALENVS_PATH=/opt/venv
ENV POETRY_VERSION=1.7.1

RUN poetry env use /usr/bin/python3 \
    && poetry config virtualenvs.create true \
    && poetry install --no-interaction --no-ansi
    
ENV PYTHONPATH="${PYTHONPATH}:/opt/venv/lib/python3.*/site-packages" 