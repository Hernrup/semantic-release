FROM node:9.11.2-alpine@sha256:8dafc0968fb4d62834d9b826d85a8feecc69bd72cd51723c62c7db67c6dec6fa

RUN apk --update add git openssh bash && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

WORKDIR /opt
ENV PATH="/opt/node_modules/.bin:${PATH}"

COPY package.json .
COPY yarn.lock .
COPY config /opt/semantic-release-config
RUN ls -la /opt/semantic-release-config
RUN yarn --prod && \
    yarn autoclean --init && \
    yarn autoclean --force && \
    rm package.json yarn.lock .yarnclean

COPY replace_version.sh /bin

ENV npm_config_loglevel=verbose

ENTRYPOINT ["semantic-release"]
CMD ["--help"]
