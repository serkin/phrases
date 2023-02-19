# Phrases
This app helps me to learn Thai
- [figma](https://www.figma.com/file/okoaQC85mWsw2W7aBZY9Hv/Phrases?node-id=0%3A1&t=sHIDdoooyc8nmOxC-0)
- [flask-mysqldb](https://github.com/alexferl/flask-mysqldb)

## Run locally
python3 -m venv venv

sudo apt-get install python3-dev default-libmysqlclient-dev build-essential
pip install -r requirements.txt

docker run --name mysql -d --restart always -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_DATABASE=seo -p 306:3306 mysql:8
docker run --name myadmin -d --restart always --link mysql:db -p 8090:80 phpmyadmin/phpmyadmin

## Run on server
```bash
docker run --name mysql -d --restart always -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_DATABASE=seo -p 127.0.0.1:3306:3306 mysql:8

docker build -f Dockerfile -t phrases .
docker rm -f phrases || true
docker run -d --name phrases --link mysql:mysql  -e 'MYSQL_HOST=mysql' -p 8080:5000 --restart always phrases

ssh -fN  -L 3307:127.0.0.1:3306 root@45.143.94.176
```
