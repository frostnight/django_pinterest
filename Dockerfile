FROM python:3.7.12

WORKDIR /home/

RUN git clone https://github.com/frostnight/django_pinterest.git

WORKDIR /home/django_pinterest/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN echo "SECRET_KEY=your-secret-key" > .env

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "django_pinterest.wsgi", "--bind", "0.0.0.0:8000"]
