FROM node:alpine as builder

RUN mkdir /app
WORKDIR  /app
COPY . .
RUN npm i
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html