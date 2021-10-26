FROM node:14

WORKDIR /app

COPY package*.json ./
RUN npm i

COPY . .
RUN npm run build

ENV PORT=3000
EXPOSE 3000

CMD ["node", "dist/main.js"]
