FROM ubuntu:16.04
WORKDIR /mydir
#RUN apt-get update && apt-get install -y curl python
#testing
COPY . .
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
EXPOSE 5000
RUN npm install && \
npm run build && \
npm install -g serve 
RUN apt-get update && \
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && \    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - &&\
apt-key fingerprint 0EBFCD88 && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
apt-get update && \ 
apt-get update && \
apt-get install docker-ce docker-ce-cli containerd.io
CMD serve -s -l 5000 dist
