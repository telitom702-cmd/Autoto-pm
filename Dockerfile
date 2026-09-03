FROM python:3.12-slim

WORKDIR /Autoto-pm

# Required system packages for lxml / IMDbPY
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libxml2-dev \
    libxslt1-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip setuptools wheel

# Install Python dependencies
COPY requirements.txt /Autoto-pm/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /Autoto-pm

# Start bot
CMD ["python", "bot.py"]
