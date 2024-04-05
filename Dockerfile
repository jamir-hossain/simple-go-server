# Start from a small base image containing the Go runtime
FROM golang:1.19-alpine AS builder

# Set necessary environment variables for Go
ENV CGO_ENABLED=0 \
    GOOS=linux

# Set the current working directory inside the container
WORKDIR /app

# Copy the Go module files
COPY go.mod .
COPY go.sum .

# Download dependencies
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o main .


# Start a new stage from scratch
FROM alpine:latest

# Set labels for metadata
LABEL maintainer="Jamir Hossain"

# Set the current working directory inside the container
WORKDIR /app

# Copy the binary from the builder stage to the final stage
COPY --from=builder /app/main .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./main"]
