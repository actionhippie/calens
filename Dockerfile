FROM golang:1.27-alpine@sha256:cf6fca6641884b8433441b2b0652976f975e1d0fdd26d177eaaf8596087f3125 AS build

# renovate: datasource=github-tags depName=restic/calens
ENV CALENS_VERSION=v0.4.0

RUN apk add --no-cache git && \
  git clone -b ${CALENS_VERSION} https://github.com/restic/calens.git /usr/src/app && \
  cd /usr/src/app && \
  GO111MODULE=on go build -o /tmp/calens

FROM alpine:3.24@sha256:e7c4abb69531cb09e2a2bbb56fad3367ab694865c49df898c1c683185cc4376c

RUN apk add --no-cache bash
ENTRYPOINT ["/usr/local/bin/entrypoint"]
COPY overlay /

COPY --from=build /tmp/calens /usr/bin/calens
