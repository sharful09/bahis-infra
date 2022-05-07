FROM python:3

ENV VENV=.venv
ENV PATH="$VENV/bin:$PATH"
#don't need to activate venv as it is already in PATH :)

RUN python3 -m venv $VENV

WORKDIR .
RUN mkdir src
COPY src/ src

RUN pip install --no-cache-dir -r src/requirements.txt

RUN pip install uwsgi
COPY little_wsgi.ini wsgi.ini
# CMD ["uwsgi", "--http", ":8000" "--module" "src/mysite.wsgi"
# CMD ["uwsgi", "wsgi.ini"]
CMD ["uwsgi", "wsgi.ini"]
