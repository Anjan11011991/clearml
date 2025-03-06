# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set environment variables for ClearML configuration
ENV CLEARML_CONFIG_FILE=/root/clearml.conf

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*  # Clean up after installation to reduce image size

# Set the working directory
WORKDIR /app

# Copy the requirements file first to leverage Docker cache during rebuilds
COPY requirements.txt /app/

# Install Python dependencies (including ClearML and other dependencies)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the ClearML configuration file into the container
COPY clearml.conf /root/clearml.conf

# Copy application files (training script and data)
COPY train.py /app/
COPY data /app/data/

# Command to run the application (start the training)
CMD ["python", "train.py"]
