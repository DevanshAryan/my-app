FROM ubuntu:latest

RUN apt update && apt upgrade -y

RUN apt install curl -y


RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash

RUN apt install nodejs -y

WORKDIR /app

COPY package.json .

COPY package-lock.json .

RUN npm i -g yarn

RUN yarn install

RUN npx playwright install

RUN npx playwright install-deps

COPY . .

CMD yarn build-storybook && yarn lost-pixel

# if you want to update baseline just un-comment this part and comment the above command

# CMD yarn build-storybook && yarn lost-pixel update