# sandman2-docker
Docker image for running Sandman2 against MSSQL 2016

- Base Ubuntu 16.04 image
- Installs Python 2.7 and setup tools
- Installs required ODBC management and MSSQL drivers
- Ready to run "sandman2ctrl" command against a SQL 2016 database instance

Sandman2 source: https://github.com/jeffknupp/sandman2

## Using this image (interactive docker session)

```bash
$ git clone https://github.com/viklas/sandman2-docker.git
$ docker build -t sandman2 .
$ docker run -it -p 5000:5000 sandman2 /bin/bash
```

Then, from within the container (replace user, password, host, port and database name with your values)

```bash
# sandman2ctl 'mssql+pyodbc://user:password@sqlserver:port/databasename?driver=ODBC+Driver+13+for+SQL+Server'
```
