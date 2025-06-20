# Use the official Python 3.11 image based on Alpine Linux (small and secure)
FROM python:3.11-alpine

# Prevent Python from writing `.pyc` files to disk
ENV PYTHONDONTWRITEBYTECODE=1

# Ensure stdout and stderr are sent straight to the terminal (for logs)
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container to /app
WORKDIR /app

# Copy the dependency file to the working directory
COPY requirements.txt .

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install Python dependencies listed in requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of your application code into the container
COPY . .

# Expose port 8000 (Django’s default port)
EXPOSE 8000

# Start the Django development server listening on all interfaces
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]