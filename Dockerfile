ARG MEDIAMTX_VERSION=1.19.1

# Extract the mediamtx binary from the official pinned image
FROM bluenviron/mediamtx:${MEDIAMTX_VERSION} AS mediamtx-source

# Alpine provides wget, sh, and curl without extra packages
FROM alpine:3.21

COPY --from=mediamtx-source /mediamtx /mediamtx

EXPOSE 9997 8554 1935 8888 8889 8890

ENTRYPOINT ["/mediamtx"]
