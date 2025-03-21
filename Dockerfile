# Stage 1: Build React App
FROM node:23 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve React App (files will be copied to Python's Nginx)
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/build /app/build
CMD ["sh", "-c", "echo 'React build complete' && sleep infinity"]
