FROM alpine:latest

RUN apk add --no-cache libc6-compat

WORKDIR /app

# Exposer le port utilisé par Maputnik
EXPOSE 8000

# Commande par défaut pour démarrer Maputnik
CMD ["./maputnik", "--watch", "--file", "style.json"]
