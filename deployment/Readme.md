

```
docker_compose build
docker_compose up
```

To initialise database for the first time:
```
psql -U postgres -h localhost -p 99 < db/init.sql
psql -U postgres -h localhost -p 99 < db/coredb.sql
```


# Problems and mitigations
There are some erros in db init scirpts. Runniing them through docker-entrypoint needs success, so for now, we run
`psql -U postgres -h localhost -p 54321 < coredb.sql` in django container
```

  # The db load didn't work
# deployment-pgdb-1  | 2022-05-07 05:47:15.458 UTC [183] ERROR:  missing data for column "details_pk"
# deployment-pgdb-1  | 2022-05-07 05:47:15.458 UTC [183] CONTEXT:  COPY list_workflow, line 1: "31	{"Bangla": "Followup", "English": "Followup"}	[{"column": "basic_info_upazila", "form_field": "ba..."
# deployment-pgdb-1  | 2022-05-07 05:47:15.458 UTC [183] STATEMENT:  COPY core.list_workflow (id, title, workflow_definition, xform_id, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, status, publish_status, list_id, workflow_type, details_pk) FROM stdin;
# deployment-pgdb-1  | psql:/docker-entrypoint-initdb.d/12_create_tables.sql:140667: ERROR:  missing data for column "details_pk"
# deployment-pgdb-1  | CONTEXT:  COPY list_workflow, line 1: "31	{"Bangla": "Followup", "English": "Followup"}	[{"column": "basic_info_upazila", "form_field": "ba..."
# deployment-pgdb-1 exited with code 3
```
