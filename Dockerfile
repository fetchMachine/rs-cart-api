FROM node:12

WORKDIR /app

COPY package*.json ./
RUN npm i --only=prod

COPY . .
RUN npm run build

ENV PORT=3000
EXPOSE 3000

ENTRYPOINT ["node", "dist/main.js"]
