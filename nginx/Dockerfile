FROM nginx:latest

ADD server.key /etc/nginx/
ADD server.crt /etc/nginx/

COPY nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf
