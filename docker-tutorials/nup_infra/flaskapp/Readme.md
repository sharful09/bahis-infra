From https://www.python4networkengineers.com/posts/python-intermediate/how_to_run_an_app_with_docker/

Build with
```
docker build -t flask_restful_app .
```
And run on localhost port 5001:
```
docker run -p 5001:5000 flask_restful_app
```

and go to
http://localhost:5001/api/v1/users
