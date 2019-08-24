# docker-youtube-dl
- Docker image wrapper of
    - [youtube-dl](https://github.com/rg3/youtube-dl)
    - [streamlink](https://github.com/streamlink/streamlink)


## Build
```bash
docker-compose build
```

## configure
Set mediaserver (output) path

```bash
cp docker.env.dist docker.env
$EDITOR docker.env
```

## Usage

youtube-dl

```bash
docker-compose run --rm --entrypoint bash s -exc \
    "mkdir -p /mediaserver/videos/x && cd /mediaserver/videos/x \
    && youtube-dl -cit 'https://www.youtube.com/watch?v=x'"
```

streamlink

```bash
docker-compose run --rm --entrypoint bash s -exc \
    "mkdir -p /mediaserver/videos/x && cd /mediaserver/videos/x \
    && streamlink --hls-live-restart -o 'outfile' 'url' best"
```
