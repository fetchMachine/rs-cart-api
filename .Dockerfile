FROM node:alphine

WORKDIR /app

COPY package*.json ./
RUN npm i only=prod

COPY . .
RUN npm run build

ENV PORT=3000
EXPOSE 3000

CMD ["node", "dist/main.js"]
