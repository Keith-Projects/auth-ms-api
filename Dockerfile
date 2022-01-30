FROM node:17.4
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

EXPOSE 9001

ADD docker/entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
