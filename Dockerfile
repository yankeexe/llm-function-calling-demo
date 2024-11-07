FROM  public.ecr.aws/docker/library/python:3.11.10-slim-bookworm

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

EXPOSE 8501

CMD ["streamlit",  "run" , "app.py", "--server.port",  "8501", "--server.address",  "0.0.0.0"]
