# plevion-dev/mediamtx

Custom Docker image wrapping [bluenviron/mediamtx](https://github.com/bluenviron/mediamtx) with a pinned version and Alpine-based shell tooling (wget, sh, curl).

## Why this exists

The official `bluenviron/mediamtx` image is scratch-based (binary only). This makes it impossible to use shell commands in MediaMTX's `runOnReady`/`runOnNotReady` hooks, and prevents any in-container debugging. This image adds Alpine as the runtime base while keeping the mediamtx binary from the official pinned release.

## Image

```
ghcr.io/plevion-dev/mediamtx:latest
ghcr.io/plevion-dev/mediamtx:1.19.1-<short-sha>
```

Supported platforms: `linux/amd64`, `linux/arm64`

## Bumping the mediamtx version

1. Update the `ARG MEDIAMTX_VERSION=` line in `Dockerfile` to the new release tag
2. Open a PR — CI will build and verify the image
3. Merge to `main` — `build-image.yml` publishes the new image tagged `v{new-version}-{sha}` and updates `latest`
4. Update the image ref in `plevion-k8s/services/mediamtx` accordingly

## Local build

```bash
docker build -t mediamtx-local .
docker run --rm -v ./mediamtx.yml:/mediamtx.yml mediamtx-local
```
