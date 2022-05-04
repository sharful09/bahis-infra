FROM python:3

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY flask_restful_app.py .
COPY little_wsgi.ini wsgi.ini

CMD ["uwsgi", "wsgi.ini"]