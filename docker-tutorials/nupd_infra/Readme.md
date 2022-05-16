`docker-compose up` to make it run, then prep database for the first time running a command for django `docker exec -ti djangoapp python src/manage.py migrate`

If you want to clean database do a
`docker-compose down -v` - down removing volumes


Note, if you get
```
> $ docker-compose up                                                                                                                                                                          [±master ●●]
[+] Running 3/3
 ⠿ Network nupd_infra_default  Created                                                                                                                                                                 0.0s
 ⠿ Volume "nupd_infra_db-vol"  Created                                                                                                                                                                 0.0s
 ⠿ Container nupd_infra-db-1   Created                                                                                                                                                                 0.0s
Attaching to nupd_infra-db-1
nupd_infra-db-1  | Error: Database is uninitialized and superuser password is not specified.
nupd_infra-db-1  |        You must specify POSTGRES_PASSWORD to a non-empty value for the
nupd_infra-db-1  |        superuser. For example, "-e POSTGRES_PASSWORD=password" on "docker run".
nupd_infra-db-1  |
nupd_infra-db-1  |        You may also use "POSTGRES_HOST_AUTH_METHOD=trust" to allow all
nupd_infra-db-1  |        connections without a password. This is *not* recommended.
nupd_infra-db-1  |
nupd_infra-db-1  |        See PostgreSQL documentation about "trust":
nupd_infra-db-1  |        https://www.postgresql.org/docs/current/auth-trust.html
nupd_infra-db-1 exited with code 1
```
it might have been because `POSTGRES_PASS` variable should be called `POSTGRES_PASSWORD`. rubbish

Another problem is when you make changes to the source, but not to the Dockerfile, cache won't be broken and files will not update. You can build with breaking cache using
```
docker-compose build --no-cache
```
