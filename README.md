#Run a private Ethereum chain with Docker

The Docker configuration provided here allows one to run a series of Ethereum nodes using Docker Compose.

To get started, build the base image:

```
$ cd ethereum-base/
$ docker build -t substrate/ethereum-base .
```

This may take some time to complete; the base image installs Ethereum, initialises a new chain and generates the DAG (the main culprit!)

Once the base image has been built, an arbitrary number of nodes may be started using Docker Compose:

```
$ cd ethereum-node/
$ docker-compose up -d
$ docker-compose scale node=3
```

If you want to tail out the logs to see what's happening:

```
$ docker-compose logs -f
```




