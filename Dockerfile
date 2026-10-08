FROM golang:1.27-alpine@sha256:738d1cf061836894ff6bb8c33881080ac66de8cf0586615012a0c8f592649cfa AS build

# renovate: datasource=github-tags depName=restic/calens
ENV CALENS_VERSION=v0.4.0

RUN apk add --no-cache git && \
  git clone -b ${CALENS_VERSION} https://github.com/restic/calens.git /usr/src/app && \
  cd /usr/src/app && \
  GO111MODULE=on go build -o /tmp/calens

FROM alpine:3.24@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6

RUN apk add --no-cache bash
ENTRYPOINT ["/usr/local/bin/entrypoint"]
COPY overlay /

COPY --from=build /tmp/calens /usr/bin/calens
