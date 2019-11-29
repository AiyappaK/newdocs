FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
copy . . 
run npm run build

from nginx
EXPOSE 80
copy --from=builder /app/build /usr/share/nginx/html
