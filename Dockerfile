FROM golang:1.6.3-alpine

MAINTAINER Bo-Yi Wu <appleboy.tw@gmail.com>

RUN apk update \
  && apk add git make curl perl && rm -rf /var/cache/apk/*

# install glide package management.
RUN curl https://glide.sh/get | sh

# install golang tools
RUN go get -u github.com/jstemmer/go-junit-report
RUN go get -u github.com/axw/gocov/gocov
RUN go get -u github.com/AlekSi/gocov-xml
RUN go get -u github.com/golang/lint/golint

# install cloc tool
RUN curl https://raw.githubusercontent.com/AlDanial/cloc/master/cloc -o /usr/bin/cloc \
  && chmod 755 /usr/bin/cloc

ADD coverage.sh /usr/bin/coverage

WORKDIR $GOPATH
