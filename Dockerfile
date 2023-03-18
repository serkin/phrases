FROM python:3.10

ADD . /app

WORKDIR /app
RUN apt update -y && apt install -y python3-dev default-libmysqlclient-dev build-essential
RUN pip install -r requirements.txt

EXPOSE 8081

CMD gunicorn --bind 0.0.0.0:8081 --timeout 180 --workers=4 'app:create_app()'
