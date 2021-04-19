FROM jenkins/jenkins:alpine
LABEL maintainer="9spire@gmail.com"

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
EXPOSE 8080