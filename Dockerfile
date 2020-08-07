FROM node
WORKDIR /mydir
ENV API_URL=http://localhost/api
RUN apt-get update && apt-get install -y curl python
COPY util ./util
COPY src ./src
COPY node_modules ./node_modules
COPY webpack.config.js .
COPY README.md .
COPY package-lock.json .
COPY package.json .
COPY config.js .
EXPOSE 5000
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
RUN npm install
RUN npm run build
RUN npm install -g serve
CMD serve -s -l 5000 dist
