FROM golang:1.22

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    vim \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

USER 65534

COPY . .

RUN go build -o server .

EXPOSE 8080

CMD ["./server"]
