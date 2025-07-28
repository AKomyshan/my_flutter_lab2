FROM node:lts-alpine

WORKDIR /app

COPY build/web /app/build/web

RUN npm install -g serve

EXPOSE 80

CMD ["serve", "-s", "build/web", "-l", "80"]