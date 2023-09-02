ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --update --no-cache \
    gcc \
    gcompat \
    libc-dev \
    go \
    npm \
    libwebp \
    libwebp-dev \
    git \
    make

ENV CGO_ENABLED=1

WORKDIR /

ARG TIDBYT_BRANCH
RUN  git clone --depth 1 --branch $TIDBYT_BRANCH https://github.com/tidbyt/pixlet

WORKDIR /pixlet

RUN make build

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
