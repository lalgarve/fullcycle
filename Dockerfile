FROM ubuntu:latest

WORKDIR /home
RUN apt-get update && \
    apt-get install wget -y

RUN wget https://go.dev/dl/go1.19.linux-amd64.tar.gz && \
    tar -C /usr/local/ -xzf go1.19.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

RUN echo 'package main' >> codeeducation.go &&\
    echo '' >> codeeducation.go &&\
    echo 'import "fmt"' >> codeeducation.go &&\
    echo "" >> codeeducation.go &&\
    echo 'func main() {' >> codeeducation.go &&\
    echo '    fmt.Println("Code.education Rocks!")' >> codeeducation.go &&\
    echo '}' >> codeeducation.go && \
    go mod init leila/codeeducation && \
    go build .

FROM scratch    

WORKDIR /home
COPY --from=0 /home/codeeducation ./

CMD [ "./codeeducation" ]