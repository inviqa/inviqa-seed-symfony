FROM quay.io/continuouspipe/php7-nginx:stable

ARG GITHUB_TOKEN=

COPY . /app
RUN container build
