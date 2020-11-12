# Stage 1
FROM node:10-alpine as build-step
RUN mkdir -p /app
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH


# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli

# add app
COPY . /app

# start app
CMD ng serve --host 0.0.0.0

# Stage 2

# FROM nginx:1.17.1-alpine
# COPY --from=build-step /app/dist/docker-test-app /usr/share/nginx/html