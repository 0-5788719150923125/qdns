FROM alpine:latest

MAINTAINER United Nations

RUN apk update && \
    apk add --no-cache \
    autoconf \
    g++ \
    make

WORKDIR /app

COPY ./* ./

WORKDIR /app/stealth/src

RUN autoconf

RUN ./configure

RUN make

RUN make install

WORKDIR /app

RUN make

CMD ["./qdns", "-h"]

MAINTAINER B