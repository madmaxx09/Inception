FROM debian:bullseye

RUN apt-get update 
RUN apt-get install -y nginx \
    openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/mdor.crt -keyout /etc/nginx/ssl/mdor.key -subj "/C=BE/ST=BC/L=Bruxelles/O=19/OU=19/CN=mdor.42.fr/UID=mdor" && \
    mkdir -p /var/run/nginx


COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]