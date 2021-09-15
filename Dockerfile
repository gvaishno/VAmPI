FROM python:3.7-alpine

RUN mkdir /vampi
RUN apk --update add bash nano

ENV vulnerable=1
ENV tokentimetolive=300

COPY . /vampi
WORKDIR /vampi

RUN apk add --no-cache python3-dev libevent-dev libffi-dev gcc musl-dev g++
RUN pip install -r requirements.txt

ENTRYPOINT ["python"]
CMD ["app.py"]
