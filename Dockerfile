FROM node:13.3.0
EXPOSE 8080
COPY server.js .
CMD node server.js

