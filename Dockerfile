FROM golang:1.22

WORKDIR /app

COPY go.mod ./
RUN go mod tidy || true

COPY . .

RUN make build

EXPOSE 9636
EXPOSE 10000

CMD ["./beth", "--datadir", "./data", "--networkid", "999", "--http", "--http.addr", "0.0.0.0", "--http.port", "9636", "--http.api", "eth,net,web3,personal,miner"]
