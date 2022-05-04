From https://www.python4networkengineers.com/posts/python-intermediate/how_to_run_an_app_with_docker/

```
docker build -t hello-python-app .
docker run hello-python-app
```

Start a container and jump in the shell:
```
docker run -it  hello-python /bin/bash
```
or connect to a running
```
$docker exec -it  hello-python /bin/bash
```
