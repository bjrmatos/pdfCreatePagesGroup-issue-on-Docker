ARG NODE_VERSION=8.11.4

FROM node:${NODE_VERSION} 

RUN apt-get update && apt-get install -y gconf-service libatk1.0-0 \
       libgconf-2-4 libgtk-3-0 libnspr4 libxcomposite1 \
       libxcursor1 libxrandr2 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils \
       fonts-liberation \
        libxtst-dev \
        libxss1 \
        libgconf2-dev \
        libnss3-dev \
        libasound2-dev \
        xvfb \
        xfonts-75dpi \
        xfonts-base 
 
#jsreports 2.3 requires a log folder
RUN mkdir -p /logs && chown -R 1000:1000 /logs


WORKDIR /app
RUN chown 1000:1000 -R /app
COPY --chown=1000:1000 jsreport/package.json ./package.json
RUN npm install
COPY --chown=1000:1000 jsreport .

WORKDIR /
COPY --chown=1000:1000 startup.sh .

#with env set jsreport use production configuration
ENV NODE_ENV "production"
#node memory
ENV NODE_OPTIONS "--max-old-space-size=1024"

ENV chrome_launchOptions_args --no-sandbox

EXPOSE 3001
ENTRYPOINT ["./startup.sh"]
CMD ["node","/app/server.js"]


