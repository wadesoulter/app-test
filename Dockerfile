# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and upgrade system packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    curl \
    wget \
    vim \
    git \
    python3 \
    python3-pip \
    python3-venv \
    libssl-dev \
    libffi-dev \
    locales && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Create a directory for the application
WORKDIR /app

# Copy the application requirements file
COPY requirements.txt /app/

# Create and activate a virtual environment
RUN python3 -m venv venv
ENV PATH="/app/venv/bin:$PATH"

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy the application code
COPY . /app

# Expose the application port
EXPOSE 8000

# Set the default command to run the application
CMD ["python3", "app.py"]





#Explanation:
    #Base Image: FROM ubuntu:latest uses the latest Ubuntu image as the base.
    
    #Environment Variables: ENV DEBIAN_FRONTEND=noninteractive prevents the package manager from asking interactive questions.
    
    #System Updates:
    
    #RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* updates and upgrades all installed packages, removes unnecessary packages, and cleans up the package cache to reduce the image size.
    
    #Package Installation:
    #RUN apt-get update && apt-get install -y ... installs necessary packages including development tools, utilities, Python, and locale settings.
   
    #Locale Settings:
    #RUN locale-gen en_US.UTF-8 generates the specified locale.
    #ENV LANG en_US.UTF-8, ENV LANGUAGE en_US:en, and ENV LC_ALL en_US.UTF-8 set the locale environment variables.
    
    #Application Setup:
    #WORKDIR /app sets the working directory to /app.
    #COPY requirements.txt /app/ copies the requirements file to the container.
    #RUN python3 -m pip install --upgrade pip && python3 -m pip install -r requirements.txt upgrades pip and installs Python dependencies.
    #COPY . /app copies the rest of the application code to the container.
    #EXPOSE 8000 exposes port 8000 for the application.
    #CMD ["python3", "app.py"] sets the default command to run the application.
