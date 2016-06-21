FROM node:6.2

RUN mkdir -p /opt
RUN chown -R daemon /opt
RUN git clone https://github.com/node-red/node-red.git /opt/node-red
WORKDIR /opt/node-red
RUN npm install
RUN ./node_modules/.bin/grunt build
ADD files/run.sh /opt/node-red/run.sh
ADD files/settings.js /opt/node-red/settings.js.template

EXPOSE 1880

CMD ["bash", "run.sh"]
