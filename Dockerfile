FROM golang:1.22-alpine AS builder
# Cache bust: 2026-02-27-07-48
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
RUN go install github.com/swaggo/swag/cmd/swag@latest
COPY . .
RUN swag init -g cmd/server/main.go -o cmd/server/docs/swagger
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-X 'main.buildTime=$(date -u +%Y-%m-%dT%H:%M:%SZ)'" -o server ./cmd/server

FROM alpine:latest
RUN apk --no-cache add ca-certificates tzdata
WORKDIR /root/
COPY --from=builder /app/server .
COPY --from=builder /app/docs ./docs
EXPOSE 8080
CMD ["./server"]
