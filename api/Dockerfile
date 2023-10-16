FROM --platform=linux/amd64 node:18-alpine

WORKDIR /app

COPY prisma prisma
COPY src src
COPY package.json ./
COPY package-lock.json ./
COPY tsconfig.json ./
COPY tsconfig.build.json ./
COPY nest-cli.json ./

RUN npm i -g @nestjs/cli
RUN npm ci
RUN npx prisma generate
RUN npm run build

CMD npm run start:prod
