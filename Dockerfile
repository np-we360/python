# Creating a python base with shared environment variables
FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1
ENV PYSETUP_PATH="/opt/pysetup" VENV_PATH="/opt/pysetup/.venv"
ENV PATH="$VENV_PATH/bin:$PATH"
ENV PIP_DEFAULT_TIMEOUT=100 \
    POETRY_NO_INTERACTION=1 POETRY_VIRTUALENVS_IN_PROJECT=true

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q && apt-get -yq install build-essential curl && \
    pip install --no-cache-dir --disable-pip-version-check --quiet poetry

LABEL org.opencontainers.image.source="https://github.com/np-we360/python"
LABEL org.opencontainers.image.title="Python3 Build Image"
LABEL org.opencontainers.image.description="A Python3 build image with Poetry"
