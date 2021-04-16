FROM alpine
LABEL maintainer="9spire@gmail.com"

RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.15.0/terraform_0.15.0_linux_amd64.zip
RUN unzip /tmp/terraform.zip -d /
RUN apk add --no-cache ca-certificates curl

ENTRYPOINT [ "/terraform" ]

USER nobody