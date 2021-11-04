FROM alpine/terragrunt:1.0.0

RUN apk update && apk upgrade
RUN apk add bash groff openssh git vim jq make curl

RUN apk -v --update add \
        python3 \
        py3-pip \
        groff \
        less \
        mailcap \
        && \
    pip3 install --upgrade awscli s3cmd python-magic && \
    apk -v --purge del && \
    rm /var/cache/apk/*

RUN mkdir -p /infra
WORKDIR /infra

RUN echo 'alias t=terragrunt' > ~/.bashrc

ENV PS1 '\[\033[1;37m\]($(echo `terraform workspace show`)) \[\033[1;33m\]\u \[\033[1;36m\]\h \[\033[1;34m\]\w\[\033[0;35m\] \[\033[1;36m\]# \[\033[0m\]'

ENTRYPOINT "bash"