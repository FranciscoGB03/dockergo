FROM golang:alpine AS build
#GOPROXY resolves dependencies treefrom cache or repository
#ENV GOPROXY=https://proxy.golang.org

#WORKDIR /go/src/api
WORKDIR /go/src/api

COPY . .
#Set OS as linux

RUN go build -o /go/bin/api main.go

#EXPOSE 8000

#CMD [ "/go/bin/api" ]

FROM alpine
COPY --from=build /go/bin/api /go/bin/api
ENTRYPOINT [ "go/bin/api" ]