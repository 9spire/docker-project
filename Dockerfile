# docker run --publish 80:80 website (first)
# docker-compose up (after compose)
# docker-compose ps (what is running now?)
# docker-compose down (take it down)

FROM nginx:alpine
LABEL maintainer="9spire@gmail.com"

COPY website /website
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80