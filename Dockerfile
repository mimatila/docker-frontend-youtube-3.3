FROM node
WORKDIR /mydir
#RUN apt-get update && apt-get install -y curl python
COPY util ./util
COPY src ./src
COPY youtube ./youtube
#COPY node_modules ./node_modules
COPY webpack.config.js .
COPY README.md .
COPY package-lock.json .
COPY package.json .
COPY config.js .
EXPOSE 5000
#RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
#RUN apt install -y nodejs
RUN npm install && \
npm run build && \
npm install -g serve 
RUN apt-get update && \
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && \    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - &&\
apt-key fingerprint 0EBFCD88 && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
apt-get update && \
apt-get install docker-ce-cli
CMD serve -s -l 5000 dist
