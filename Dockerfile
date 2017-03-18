
FROM debian:jessie
ADD ./bin/build.sh /bin/rebuild-repo

RUN chmod +x /bin/rebuild-repo
RUN apt-get update && \
  apt-get install nginx dpkg-dev -y

COPY ./src/default.conf /etc/nginx/conf.d/default.conf

RUN rm -R /var/www/html
#entrypoint
#ENTRYPOINT ["/bin/rebuild-repo"]

#CMD  ["nginx", "-g", "daemon off;"]

ENTRYPOINT /bin/sh /bin/rebuild-repo && nginx -g "daemon off;" && /bin/bash
