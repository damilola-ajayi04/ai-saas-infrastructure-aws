FROM nginx:stable-alpine

COPY app/index.html /usr/share/nginx/html/index.html
COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN chown -R nginx:nginx /usr/share/nginx/html \
    && chown -R nginx:nginx /var/cache/nginx \
    && chown -R nginx:nginx /var/log/nginx

USER nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]