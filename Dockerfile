# multi-step dockerfile!
# step 1
FROM node:16-alpine AS builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# step 2
FROM nginx

# copy over the build folder to nginx container
COPY --from=builder /app/build /user/share/nginx/html