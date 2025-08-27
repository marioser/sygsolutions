# Stage 1: Prepare files
FROM alpine:latest as builder
WORKDIR /app
COPY "SyG Soluciones/" .

# Stage 2: Production image
FROM nginx:alpine
COPY --from=builder /app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
