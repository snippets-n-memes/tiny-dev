FROM ubuntu:jammy

RUN apt-get update && apt-get install -y openssh-server sudo curl

RUN curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - && \
    apt-get install -y nodejs

RUN service ssh start

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 22

CMD ["/entrypoint.sh"]