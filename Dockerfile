FROM nginx

ARG NX_API_URL
ENV NX_API_URL=$NX_API_URL


# RUN yarn nx build modern-instrumentations --configuration=production

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./build /usr/share/nginx/html
COPY .env.local .

WORKDIR /usr/share/nginx/html

EXPOSE 80

