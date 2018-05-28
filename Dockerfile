FROM golang:alpine

ENV GOPATH /go
ENV PATH "$GOPATH/bin:$PATH"

RUN apk update && apk upgrade && \
    apk add --no-cache git

# Install beego framework
RUN go get -u github.com/astaxie/beego
RUN go get -u github.com/beego/bee

# Install beego ToDO sample app
RUN go get -u github.com/beego/samples/todo

# Install Security Headers
COPY . "${GOPATH}/src/github.com/beego-security-headers"

# Enable Security Headers

# 1. import beego-security-headers
RUN sed -i 's|\("github.com/beego/samples/todo/controllers"\)|\1\n\tsecurityHeaders "github.com/beego-security-headers"|' \
    "${GOPATH}/src/github.com/beego/samples/todo/main.go"

# 2. init beego-security-headers
RUN sed -i 's|\(func main() {\)|\1\n\tsecurityHeaders.Init()|' \
    "${GOPATH}/src/github.com/beego/samples/todo/main.go"

# 3. include beego-security-headers
COPY default.conf "${GOPATH}/src/github.com/beego/samples/todo/conf/secheaders.conf"
RUN echo >> "${GOPATH}/src/github.com/beego/samples/todo/conf/app.conf"
RUN echo 'include "secheaders.conf"' >> "${GOPATH}/src/github.com/beego/samples/todo/conf/app.conf"

CMD cd "${GOPATH}/src/github.com/beego/samples/todo" && bee run

