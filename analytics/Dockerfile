# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
# Make sure you have Flask, Flask-SQLAlchemy, psycopg2, etc., listed in your requirements.txt file
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 5153 available to the world outside this container
EXPOSE 5153

# Define environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5153
ENV DB_USERNAME=myuser
ENV DB_PASSWORD=mypassword
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5433
ENV DB_NAME=mydatabase 

# Run app.py when the container launches
CMD ["python", "app.py"]

