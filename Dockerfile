FROM corpusops/python:3.7-alpine as streamlink

ADD pkgs .
RUN apk update && apk add --no-cache $(cat pkgs)
RUN bash -exc ': \
       && git clone https://github.com/streamlink/streamlink'
RUN bash -exc ': \
        && cd /streamlink\
        && pip install -U pip \
        && pip wheel . \
        && find -name "*whl"'

FROM corpusops/python:3.7-alpine
# ARG VERSION=2019.05.20
ARG VERSION=2019.08.13
#ARG VERSION=2019.01.24

RUN apk update && apk add --no-cache \
      ffmpeg \
      ca-certificates \
      coreutils \
      libc6-compat \
      findutils \
      musl \
      tk \
      tzdata
RUN wget https://yt-dl.org/downloads/$VERSION/youtube-dl -O /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl
COPY --from=streamlink /streamlink/*.whl ./
RUN pip install *.whl

ENTRYPOINT ["/usr/local/bin/youtube-dl"]
