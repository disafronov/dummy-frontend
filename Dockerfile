# The builder image
FROM node:24.4.1 AS builder
ENV NODE_ENV=production
WORKDIR /app
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=secret,id=npmrc,target=/home/node/.npmrc \
    npm ci --omit=dev
COPY . .
RUN npm run build

# The production image
FROM nginxinc/nginx-unprivileged:1.29.0 AS production
COPY --from=builder /app/build/ /usr/share/nginx/html/
