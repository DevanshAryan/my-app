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

RUN yarn build-storybook




RUN yarn lost-pixel
