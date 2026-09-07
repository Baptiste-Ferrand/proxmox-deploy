FROM python:3.13-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        openssh-client \
        make \
        git \
        gcc \
        libffi-dev \
        libssl-dev \
        curl \
        jq \
    && rm -rf /var/lib/apt/lists/*


COPY requirements.txt /tmp/requirements.txt

RUN pip install --upgrade pip \
    && pip install -r /tmp/requirements.txt

COPY requirements.yml /tmp/requirements.yml

RUN ansible-galaxy collection install \
    -r /tmp/requirements.yml

RUN ansible --version \
    && ansible-lint --version \
    && ansible-galaxy collection list

WORKDIR /workspace