FROM nginx

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./build /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

EXPOSE 80

