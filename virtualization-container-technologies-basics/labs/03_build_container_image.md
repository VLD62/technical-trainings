# Lab 03 - Build and Run a Custom Image

## Goal

Build the provided Python service as a container image and run it with explicit limits.

## Step 1 - Inspect the Files

```bash
cat examples/hello-container/Dockerfile
cat examples/hello-container/app.py
```

Identify:

- Base image
- Working directory
- Copied application file
- Non-root user
- Exposed application port
- Startup command

## Step 2 - Build

```bash
make build
```

Equivalent command:

```bash
docker build \
  -t virtualization-training/hello:local \
  examples/hello-container
```

## Step 3 - Inspect the Image

```bash
docker image inspect virtualization-training/hello:local
docker image history virtualization-training/hello:local
```

## Step 4 - Run with Limits

```bash
make run
```

Open:

```text
http://localhost:8080
```

Or test from the terminal:

```bash
curl http://localhost:8080
```

## Step 5 - Inspect Runtime Configuration

```bash
docker inspect virtualization-training-hello
docker stats --no-stream virtualization-training-hello
docker top virtualization-training-hello
make logs
```

## Step 6 - Change Runtime Configuration

Stop the container:

```bash
make stop
```

Run with a custom message:

```bash
docker run -d \
  --name virtualization-training-hello \
  -p 8080:8080 \
  -e TRAINING_MESSAGE='configured at runtime' \
  --memory 128m \
  --cpus 0.50 \
  virtualization-training/hello:local
```

Refresh the response.

## Cleanup

```bash
make stop
```

Optional image cleanup:

```bash
docker image rm virtualization-training/hello:local
```

## Review Questions

1. What belongs in the image?
2. What should be configured at runtime?
3. Why does the example use a non-root user?
4. What is the difference between `EXPOSE` and `-p`?
5. What happens when the main Python process exits?
