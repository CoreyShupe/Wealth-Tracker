FROM --platform=linux/amd64 node:18-alpine

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
COPY .npmrc ./
COPY svelte.config.js ./
COPY tsconfig.json ./
COPY vite.config.ts ./

RUN npm ci

COPY static static
COPY src src

RUN npm run build

CMD node build
