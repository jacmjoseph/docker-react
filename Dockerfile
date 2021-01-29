#FROM node:alpine as stage1 //WON"T WORK WITH AWS, HENCE USING A DIFFERENT METHOD

FROM node:alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
#COPY --from=stage1 /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html
