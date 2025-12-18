FROM golang:1.25-alpine@sha256:72567335df90b4ed71c01bf91fb5f8cc09fc4d5f6f21e183a085bafc7ae1bec8 AS build

# renovate: datasource=github-tags depName=restic/calens
ENV CALENS_VERSION=v0.4.0

RUN apk add --no-cache git && \
  git clone -b ${CALENS_VERSION} https://github.com/restic/calens.git /usr/src/app && \
  cd /usr/src/app && \
  GO111MODULE=on go build -o /tmp/calens

FROM alpine:3.23@sha256:be171b562d67532ea8b3c9d1fc0904288818bb36fc8359f954a7b7f1f9130fb2

RUN apk add --no-cache bash
ENTRYPOINT ["/usr/local/bin/entrypoint"]
COPY overlay /

COPY --from=build /tmp/calens /usr/bin/calens
