FROM python:3.10-slim-bookworm

# system update + git install
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# work directory
WORKDIR /app

# requirements copy
COPY requirements.txt .

# python deps install
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# project copy
COPY . .

# bot start command
CMD ["python", "bot.py"]

