FROM python:3

# Set the working directory
WORKDIR /data

# Install system packages including distutils
RUN apt-get update && apt-get install -y python3-distutils python3-pip

# Upgrade pip and install necessary Python dependencies
RUN pip install --upgrade pip
RUN pip install django==3.2

# Copy your project files
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose port 8000
EXPOSE 8000

# Run the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



