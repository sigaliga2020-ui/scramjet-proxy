FROM node:20-alpine

ENV NODE_ENV=production

WORKDIR /app

RUN corepack enable

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./

RUN pnpm install --frozen-lockfile --prod=false

COPY . .

EXPOSE 8080

CMD ["node", "src/index.js"]
