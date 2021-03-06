FROM node
WORKDIR /mydir
COPY . .
#RUN apt-get update && apt-get install -y curl python
#RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
#RUN apt install -y nodejs
EXPOSE 5000
RUN npm install && \
    npm run build && \
    npm install -g serve && \
    apt-get update && \    
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
    apt-get install -y docker-ce-cli
CMD serve -s -l 5000 dist
