FROM node
WORKDIR /mydir
RUN apt-get update && apt-get install -y curl python
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
#RUN npm install
RUN npm run build
COPY . .
EXPOSE 5000
RUN npm install -g serve
CMD serve -s -l 5000 dist
