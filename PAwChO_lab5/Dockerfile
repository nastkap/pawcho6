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
RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-client && \
    rm -rf /var/lib/apt/lists/*

# Dodanie klucza SSH do kontenera
COPY gh_cli_w_ed25519 /root/.ssh
RUN chmod 600 /root/.ssh

# Pobranie repozytorium 
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/nastkap/pawcho6.git /app
