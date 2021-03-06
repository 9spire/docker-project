FROM nginx:alpine
LABEL maintainer="9spire@gmail.com"

COPY website /website
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80