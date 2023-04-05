cd /root/phrases
docker build -f Dockerfile -t phrases . && \
    docker rm -f phrases || true && \
    docker run -d --name phrases --link mysql:mysql -e 'SESSION_TYPE=filesystem' -e 'SQLALCHEMY_DATABASE_URI=mysql://root:@mysql/phrases' -p 8081:8080 --restart always phrases