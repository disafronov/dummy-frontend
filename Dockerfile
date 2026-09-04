# The builder image
FROM node:26.8.1 AS builder
WORKDIR /app
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=secret,id=npmrc,target=/home/node/.npmrc \
    npm ci
COPY . .
RUN npm run build

# The production image
FROM nginxinc/nginx-unprivileged:1.31.5 AS production
COPY --from=builder /app/dist/ /usr/share/nginx/html/
