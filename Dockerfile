FROM golang:1.25-alpine@sha256:aee43c3ccbf24fdffb7295693b6e33b21e01baec1b2a55acc351fde345e9ec34 AS build

# renovate: datasource=github-tags depName=restic/calens
ENV CALENS_VERSION=v0.4.0

RUN apk add --no-cache git && \
  git clone -b ${CALENS_VERSION} https://github.com/restic/calens.git /usr/src/app && \
  cd /usr/src/app && \
  GO111MODULE=on go build -o /tmp/calens

FROM alpine:3.22@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412

RUN apk add --no-cache bash
ENTRYPOINT ["/usr/local/bin/entrypoint"]
COPY overlay /

COPY --from=build /tmp/calens /usr/bin/calens
