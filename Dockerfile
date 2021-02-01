FROM python:3.9-slim-buster

EXPOSE 80

RUN echo ' ---> Install additional dependencies' && apt-get update && apt-get install -y \
  pipenv \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./Pipfile* ./

RUN echo ' ---> Installing python dependencies' && \
    pipenv install --dev --system --deploy

COPY . .

CMD [ "/usr/local/bin/python", "-m", "sanic", "server.app", "--host=0.0.0.0", "--port=80"]