FROM python:3.9-slim

# Install git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/mihaiLambru/microservices-aws-kubernetes-project-starter.git /app

WORKDIR /app/analytics

RUN pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 5153

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5153
ENV DB_USERNAME=myuser
ENV DB_PASSWORD=mypassword
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5433
ENV DB_NAME=mydatabase

CMD ["python", "app.py"]
