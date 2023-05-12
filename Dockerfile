#using Node v10
FROM node:10

#Create app directory
WORKDIR /usr/src/lafs

#Install app dependencies
#A wildcard is used to ensure both package.json AND package-lock.json are copied
#where available (npm@5+)
COPY package*.json ./

RUN npm install
#If building for production
# RUN npm ci --omit=dev

#Bundle app source
COPY . .

#Expose the port outside the container
EXPOSE 3000

#Command to start the application
CMD npm run start