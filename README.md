# Go Server

A simple go server.

### Build the docker image

```bash
docker build -t go_server .
```

### Run the container

```bash
docker run -p 8080:8080 -e PORT=8080 goserver
```

### Check if the server is running

1. Go to `http://localhost:8080` and check if you see "`Hello, from Ostad! <3`".
2. Go to `http://localhost:8080/health` and check if you see "`{"Status": "OK"}`".
