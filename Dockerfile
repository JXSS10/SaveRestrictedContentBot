FROM python:3.10
WORKDIR /app

# تثبيت أداة ffmpeg وتحديث مستودعات النظام
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip3 install -r requirements.txt

COPY . /app
CMD gunicorn app:app & python3 main.py
