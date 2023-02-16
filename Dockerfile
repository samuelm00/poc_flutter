FROM ubuntu:latest

ARG Environment=development

RUN apt-get update && \
  apt-get install -y curl git wget unzip python3 python3-pip
RUN git clone --depth=1 --branch=stable https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter channel stable && flutter upgrade
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web --target "lib/main_${Environment}.dart" --release

# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/web/server.sh"]

ENTRYPOINT [ "/app/web/server.sh"]