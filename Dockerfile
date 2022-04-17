FROM node:16.4
LABEL Keith Blackwelder"kblackwelder08@gmail.com"

ARG APP=auth-ms-api
ARG VERSION
ENV npm_package_version=${VERSION}
RUN apt-get -y update && apt-get -y --no-install-recommends install \
  curl \
  ssh \
  git \
  nano \
  net-tools 

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

WORKDIR /app

COPY package.json ./
RUN npm install
COPY . .

EXPOSE 5000

RUN ln -s /app/node_modules/.bin/forever /usr/local/bin

RUN apt-get install -y dos2unix
RUN dos2unix /usr/local/bin/docker/entrypoint.sh
ADD docker/entrypoint.sh /entrypoint.sh

CMD [ "./entrypoint.sh" ]