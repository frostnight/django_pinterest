FROM python:3.7.12

WORKDIR /home/

RUN git clone https://github.com/frostnight/django_pinterest.git

WORKDIR /home/frostnight/

RUN pip install -r requirements.txt

RUN echo ""

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
