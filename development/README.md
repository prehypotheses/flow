
<br>

## The Store

Notes vis-à-vis the `backendstore` database.

```sql
SELECT * from information_schema.tables 
  where table_schema = 'public' and table_type = 'BASE TABLE';
```

<br>

**The experiments**

experiment_id | name | artifact_location | lifecycle_stage | creation_time | last_update_time

The distinct experiments thus far

```sql
select * from experiments;
```

and a description of

```shell
\d experiments
```

**The Tags**

key | value | run_uuid

```sql
select * from tags;
```

Each unique *run* of the `run_uuid` field is associated with a set distinct keys via the `key` field, i.e., `select distinct key from tags;`.

```sql
select run_uuid, count(*) as n from tags group by run_uuid order by run_uuid desc;
```

