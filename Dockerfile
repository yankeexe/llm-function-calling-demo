FROM  public.ecr.aws/docker/library/python:3.11.10-slim-bookworm

ENV STREAMLIT_SERVER_PORT=8501
ENV STREAMLIT_SERVER_ADDRESS=0.0.0.0
ENV OLLAMA_HOST=host.docker.internal

WORKDIR /app

COPY requirements/ requirements

COPY Makefile .

RUN  <<eot
    set -ex

    pip install --upgrade pip
    pip install -r requirements/requirements-dev.txt
    pip install -r requirements/requirements.txt
eot

COPY app.py .

EXPOSE $STREAMLIT_SERVER_PORT

CMD ["streamlit",  "run" , "app.py"]
