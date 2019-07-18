FROM node:alpine as mybuilder
RUN mkdir -p /code
WORKDIR /code
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
#CMD ["npm", "run", "build"]

FROM nginx
COPY --from=mybuilder ./code/build /usr/share/nginx/html
