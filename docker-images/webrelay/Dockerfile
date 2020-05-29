FROM python:3.8

ENV TARGET=https://www.google.com
ENV LISTEN=8000

WORKDIR /srv
COPY requirements.txt .
RUN pip3 install -r requirements.txt && rm requirements.txt
COPY srv.py .

CMD python srv.py
