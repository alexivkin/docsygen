# Hugo+node based off alpine
FROM node:15-alpine

# Grab the latest Hugo - curl -sL https://github.com/gohugoio/hugo/releases | grep -o '/gohugoio/hugo/releases/tag/v[0-9]*\.[0-9]*\.[0-9]*' | sort --version-sort | tail -1 | grep -o '[0-9]*\.[0-9]*\.[0-9]*'
ENV HUGO_VERSION=0.79.1
ENV HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz"
ENV DEBIAN_FRONTEND=noninteractive

COPY package.json /app/

# Grab libc because hugo extended is build with glibc
RUN apk add --update --no-cache libc6-compat libstdc++ curl git \
 && rm -rf /var/cache/apk/* \
 && cd /app/ \
 && npm install \
 && curl -sL "$HUGO_URL" | tar zx hugo \
 && git clone https://github.com/google/docsy /app/themes/docsy \
 && cd /app/themes/docsy \
 && git submodule update --init --recursive --depth 1 \
 && chown -R node:node /app

# Docsy bugfix for handling non-standard contentdirs in edit links
COPY layouts/ /app/themes/docsy/layouts/

USER node
EXPOSE 1313
WORKDIR /app/
ENTRYPOINT ["/app/hugo"]