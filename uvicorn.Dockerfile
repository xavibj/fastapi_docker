FROM python

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV PYTHONUNBUFFERED=1

EXPOSE 8000
WORKDIR /api
COPY ./api /api
RUN apt -qqy update && apt upgrade -qqy

RUN pip install fastapi
RUN pip install pyyaml
RUN pip install uvicorn

CMD uvicorn main:app --host 0.0.0.0 --reload