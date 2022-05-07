### Make it run!
```
docker build -t djangoworld . && docker run -p 8003:8000 djangoworld
```
and visit on
```
localhost:8003
```
### Problems encountered

https://www.python4networkengineers.com/posts/python-intermediate/how_to_run_an_app_with_docker/

Interesting and annoying fact. The following error
```
> $ docker run -p 8001:8000 djangoworld                                                                                                                                                        [±master ●●]

/bin/sh: 1: [uwsgi,: not found
```
comes up when you run a more complex uwsgi command, not necessarily when it cannot find the exec. For instance
```
CMD ["uwsgi", "--http", ":8000" "--module" "src/mysite.wsgi"
```
didn't work and I had to move all to wsgi.ini file to make it run.


Additionally when prepping the app and getting
```
invalid request block size: 21573 (max 4096)...skip
```
see (https://stackoverflow.com/questions/15878176/uwsgi-invalid-request-block-size#21182437) that you should run uwsgi with http not socket until you have nginx
```
http=0.0.0.0:8000
#socket=0.0.0.0:8000
```
