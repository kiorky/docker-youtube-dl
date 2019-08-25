# docker-youtube-dl
Docker image of [youtube-dl](https://github.com/rg3/youtube-dl).

# Build
```bash
$ docker build --build-arg VERSION=$YOUTUBEDL_VERSION -t youtube-dl .
# docker build --build-arg VERSION=2018.12.17 -t youtube-dl .
```

# Usage

### Run `youtube-dl` directly
```bash
docker run --rm -it kiorky/youtube-dl:latest --help
```

### Run shell
```bash
docker run --rm -it --entrypoint=/bin/sh rayou/youtube-dl:latest

docker-compose run --rm --entrypoint bash s -exc \
    "mkdir -p /mediaserver/videos/x && cd /mediaserver/videos/x && youtube-dl -cit 'https://www.youtube.com/watch?v=x'"
```
