FROM node:14-alpine as base
RUN apk update && apk upgrade --no-cache
RUN apk add npm && apk add git
RUN git clone https://github.com/nodejs/nodejs.org.git
WORKDIR /nodejs.org
RUN npm install 



FROM base
RUN apk update && apk upgrade --no-cache
RUN apk add npm && apk add git
RUN git clone https://github.com/nodejs/nodejs.org.git
WORKDIR /nodejs.org
COPY --from=0 nodejs.org/node_modules . 
CMD [ "npm", "start" ] 
EXPOSE 8080 