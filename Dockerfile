FROM python:3
ADD . /code
WORKDIR /code

ENV DJANGO_SUPERUSER_USERNAME=thiago
ENV DJANGO_SUPERUSER_PASSWORD=thiago
ENV DJANGO_SUPERUSER_EMAIL=thiago@thiago.com

RUN python -m pip install --upgrade pip
RUN pip install django==3.2
RUN pip install gunicorn==20.1.0
RUN pip install psycopg2-binary==2.9.3

RUN python manage.py collectstatic

EXPOSE 80

CMD gunicorn alurareceita.wsgi --bind 0.0.0.0:80
