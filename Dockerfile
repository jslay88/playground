FROM python:3.9-alpine as base
RUN apk update && apk upgrade --no-cache
RUN pip install flit

FROM base
RUN adduser -g "playground" --disabled-password playground
USER playground

WORKDIR /src

COPY . /src

RUN flit install --symlink
ENV PATH="/home/playground/.local/bin:${PATH}"

ENTRYPOINT ["hello_world"]
