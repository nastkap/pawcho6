# syntax=docker/dockerfile:1 

# Etap pierwszy: budowa aplikacji Node.js
FROM node:alpine AS builder

ARG VERSION
ENV APP_VER=production.${VERSION:-v1.0}

WORKDIR /usr/app
COPY ./package.json ./ 
RUN npm install
COPY ./kod.js ./


# Etap drugi: serwer Nginx
FROM nginx:latest

ARG VERSION
ENV APP_VER=production.${VERSION:-v1.0}

COPY --from=builder /usr/app/ /usr/share/nginx/html/

# Ustawienie pliku HTML aplikacji jako stronę domyślną
RUN ln -sf /usr/share/nginx/html/kod.js /usr/share/nginx/html/index.html
EXPOSE 80
# Zdefiniowanie komendy startowej (uruchomienie serwera Nginx)
CMD ["nginx", "-g", "daemon off;"]

# Sprawdzanie poprawności działania aplikacji Node.js
HEALTHCHECK --interval=10s --timeout=1s \
  CMD curl -f http://localhost/ || exit 1

# Dodatkowe polecenia do obsługi protokołu SSH i kluczy SSH
RUN apk update && \
    apk add --no-cache openssh-client

# Dodanie klucza SSH do kontenera
COPY ssh_key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# Pobranie repozytorium i zbudowanie obrazu Docker na podstawie jego zawartości
RUN git clone git@github.com:nastkap/pawcho6.git /app
RUN docker build -t pawcho6-gh/app
