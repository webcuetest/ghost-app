FROM node:18 as build
RUN apt install git
RUN git clone https://github.com/colinmeinke/ghost-storage-adapter-s3
RUN git clone https://github.com/TryGhost/Alto
RUN cd ghost-storage-adapter-s3 && npm install

FROM ghost:latest
COPY --from=build ghost-storage-adapter-s3 content/adapters/storage/s3
COPY --from=build Alto content/themes/alto

EXPOSE 2368/tcp
