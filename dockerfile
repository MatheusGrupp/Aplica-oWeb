FROM node:18-alpine AS base
 


 # Instala apenas dependencias necessarias
 FROM base AS deps
 # Checa para entender o porque libc6-compat pode ser preciso https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine
 RUN apk add --no-cache libc6-compat
 WORKDIR /app

 

 #Instala as dependencias com base no package manager preferido
 COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* ./
 RUN \
   if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
   elif [ -f package-lock.json ]; then npm ci; \
   elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm i --frozen-lockfile; \
   else echo "Lockfile not found." && exit 1; \
   fi
 
 
 # Reconstrói o código source
 FROM base AS builder
 WORKDIR /app
 COPY --from=deps /app/node_modules ./node_modules
 COPY . .
 

 
 RUN \
   if [ -f yarn.lock ]; then yarn run build; \
   elif [ -f package-lock.json ]; then npm run build; \
   elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm run build; \
   else echo "Lockfile not found." && exit 1; \
   fi
 

 # Production image, copy all the files and run next
 FROM base AS runner
 WORKDIR /app
 

 ENV NODE_ENV=production
 RUN addgroup --system --gid 1001 nodejs
 RUN adduser --system --uid 1001 nextjs
 
 COPY --from=builder /app/public ./public
 
 # Define as permissões corretas
 RUN mkdir .next
 RUN chown nextjs:nodejs .next
 


 # Reduz automaticamente o tamanho da foto
 COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
 COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static
 
 USER nextjs
 
 EXPOSE 3000
 
 ENV PORT=3000
 ENV HOSTNAME="0.0.0.0"
 CMD ["node", "server.js"]