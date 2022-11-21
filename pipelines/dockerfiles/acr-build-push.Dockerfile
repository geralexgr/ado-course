FROM python:latest
LABEL Maintainer="Gerasimos Alexiou"
WORKDIR /usr/app/src
COPY python/print_datetime.py ./
CMD [ "python", "./print_datetime.py"]