FROM nginx
RUN echo "Copy file from source"
COPY ./html/* /usr/share/nginx/html/
EXPOSE 80