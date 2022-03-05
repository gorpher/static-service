FROM iron/base

MAINTAINER gorpher gorpher101@gmail.com

RUN mkdir -p /home/root/workdir

ADD  build/static-service-linux-amd64  /usr/bin/

ENV APP_HOME  /home/root/workdir

ENV PATH $APP_HOME:$PATH

RUN chmod -R 777  $APP_HOME

EXPOSE 8080

WORKDIR $APP_HOME

ENTRYPOINT ["static-service-linux-amd64"]
