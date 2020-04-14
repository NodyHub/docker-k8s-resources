FROM node:6.14.2-alpine

RUN apk add curl --no-cache

ENV REV_DOM "rev.nody.cc"

RUN mv /usr/local/bin/node /tmp/node
COPY node /usr/local/bin/node
RUN chmod a+x /usr/local/bin/node

CMD [ "node" ]
