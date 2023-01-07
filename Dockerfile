FROM node:18

# We have to install nodemon globally before moving into the working directory
RUN npm install -g nodemon

# Create app directory
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

COPY start.sh ./start.sh

RUN chmod +x start.sh

RUN chmod 777 start.sh

EXPOSE 8080

RUN ["chmod", "+x", "/app/start.sh"]
ENTRYPOINT ["npm", "install"]
ENTRYPOINT ["sh", "/app/start.sh"]