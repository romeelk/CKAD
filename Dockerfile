FROM alpine

COPY file.txt .
CMD while true ; do cat file.txt ; sleep ; done
