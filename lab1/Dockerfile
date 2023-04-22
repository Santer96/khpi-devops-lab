FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron

COPY container_status_check.sh .

RUN chmod +x container_status_check.sh

COPY container_cron /etc/cron.d/container_cron

RUN chmod 0644 /etc/cron.d/container_cron

RUN crontab /etc/cron.d/container_cron

RUN * * * * * /usr/bin/sh /container_status_check.sh

ENTRYPOINT ["cron", "-f"]
