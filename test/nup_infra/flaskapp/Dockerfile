FROM python:3

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY flask_restful_app.py .

CMD [ "python", "./flask_restful_app.py" ]