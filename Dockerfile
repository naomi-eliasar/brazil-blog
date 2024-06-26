# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install dependencies
COPY requirements.txt /code/
RUN apt-get update && apt-get install -y gcc

RUN pip install --upgrade pip
RUN pip install --default-timeout=10000 -r requirements.txt

# Copy project
COPY . /code/