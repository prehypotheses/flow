
<br>

## The Store

Notes vis-à-vis the `backendstore` database.

```sql
SELECT * from information_schema.tables 
  where table_schema = 'public' and table_type = 'BASE TABLE';
```

<br>

**experiments**

experiment_id | name | artifact_location | lifecycle_stage | creation_time | last_update_time

The distinct experiments thus far

```sql
select * from experiments;
```

and a description of

```shell
\d experiments
```

<br>

**tags**

key | value | run_uuid

```sql
select * from tags;
```

Each unique *run* of the `run_uuid` field is associated with a set distinct keys via the `key` field, i.e., `select distinct key from tags;`.

```sql
select run_uuid, count(*) as n from tags group by run_uuid order by run_uuid desc;
```

<br>

**params**

key | value | run_uuid

The unique set of `key` strings are the parameters set-up for model training; the value of a few are the initial values of the hyperparameter opt stage.

```sql
select * from params;
```

<br>

**metrics**

The error measures & error metrics per run of an experiment.

```shell
\d metrics
```

key | value | timestamp | run_uuid | step | is_nan

The number of metrics per run 

```sql
select run_uuid, count(*) as n from metrics group by run_uuid order by run_uuid desc;
```








