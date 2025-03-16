# Step 1: Use an official Python runtime as the base image
FROM python:3.13-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the requirements.txt file and install dependencies
COPY requirements.txt /app/

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Step 4: Copy the rest of the application files into the container
COPY . /app/

# Step 5: Expose the port that your Django app will run on
EXPOSE 8000

# Step 6: Set the command to run Gunicorn when the container starts
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "DFA.wsgi:application"]