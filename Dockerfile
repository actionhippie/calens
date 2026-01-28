FROM golang:1.25-alpine@sha256:660f0b83cf50091e3777e4730ccc0e63e83fea2c420c872af5c60cb357dcafb2 AS build

# renovate: datasource=github-tags depName=restic/calens
ENV CALENS_VERSION=v0.4.0

RUN apk add --no-cache git && \
  git clone -b ${CALENS_VERSION} https://github.com/restic/calens.git /usr/src/app && \
  cd /usr/src/app && \
  GO111MODULE=on go build -o /tmp/calens

FROM alpine:3.23@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659

RUN apk add --no-cache bash
ENTRYPOINT ["/usr/local/bin/entrypoint"]
COPY overlay /

COPY --from=build /tmp/calens /usr/bin/calens
