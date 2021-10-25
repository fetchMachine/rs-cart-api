FROM node:14-alpine as build

WORKDIR /app

COPY package*.json ./
RUN npm i --only=prod

COPY . .
RUN npm run build

FROM node:14-alpine as app

COPY --from=build /app/dist ./dist

ENV PORT=3000
EXPOSE 3000

CMD ["node", "dist/main.js"]
