
<br>

> [!NOTE]
> docker build . --file .devcontainer/Dockerfile -t flow

<br>

Beware of:

* Automatic database password changes
* The inbound rules settings of the security groups, of virtual private clouds.  Especially, the internet protocol values. 

<br>

The first impacts the private environment variables `.env` script:

```env
ARTEFACT_ROOT=s3://.../..
KEY=postgresql://{username}:{password}
ENDPOINT={endpoint}
PORT={port.number}
DB={database.name}
SSLROOTCERT={pem}
```

wherein `ENDPOINT` $\equiv$ `host`

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
