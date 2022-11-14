FROM python:3.7-alpine

RUN mkdir /app
RUN apk --update add bash nano g++

ENV vulnerable=1
ENV tokentimetolive=120

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]
CMD ["app.py"]
