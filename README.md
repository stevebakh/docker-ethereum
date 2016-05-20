#Run a private Ethereum chain with Docker

The Docker configuration provided here allows one to run a number of Ethereum nodes using Docker Compose. It should go without saying that this package is intended purely for testing and evaluating Ethereum and should not be used for production.

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

##What's going on?

In short, I wanted to learn about Ethereum (how it works and how to use it). I haven't quite done that yet, but as part of my journey, I wanted a way to easily spin up an Ethereum network with a private chain. This package will allow anybody to easily run a set of nodes that automatically connect to one another. 

Feedback, pull requests, suggestions, friendly conversation welcome.

##Troubleshooting

If you're running into any problems using these Docker images or the Compose config, please let me know. I'm using the following tools:

* docker (1.11.1)
* docker-compose (1.7.1)
* docker-machine (0.7.0)

The base image should pull the latest stable version of Ethereum, and should use the latest version of Ubuntu.

###Known issues

* The `docker-compose.yml` file is not compatible with docker versions < 1.6

