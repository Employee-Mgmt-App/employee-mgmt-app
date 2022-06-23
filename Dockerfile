FROM node:16.14.0

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm i @angular/cli@13.3.8
RUN npm install


COPY . .


EXPOSE 4200

CMD ["npm","build"]