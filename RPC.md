# RPC

## Setup

To setup a new RPC/API/gRPC node:

```console
CHAIN_ID=<chain_id> \
PASSWORD='<password>' \
SNAPSHOT_URL=<snapshot_url> \
MONIKER=<moniker> \
DD_API_KEY=<dd_api_key> \
RPC_HOSTNAME=<rpc_hostname> 
API_HOSTNAME=<api_hostname> \
PROVIDER=<provider> \
TARGET=<target> \
make rpc-setup
```

where:

| Param            | Description                                                                              | Required |
|------------------|------------------------------------------------------------------------------------------|----------|
| `<chain_id>`     | The chain to setup (e.g.: `cosmoshub-4`).                                                | true     |
| `<password>`     | The password for the default user that gets created.                                     | true     |
| `<snapshot_url>` | The snapshot URL to set the node up with (note: only supports `.tar.lz4` and `.tar.gz`). | true     |
| `<moniker>`      | The name that the node will be known by on the network (e.g.: `some-node`).              | true     |
| `<dd_api_key>`   | The DataDog API key.                                                                     | false    |
| `<rpc_hostname>` | The default FQDN that Nginx will respond to RPC queries on.                              | true     |
| `<api_hostname>` | The default FQDN that Nginx will respond to API queries on.                              | true     |
| `<provider>`     | The datacenter/provider (e.g.: `ovhcloud`).                                              | true     |
| `<target>`       | The IP address of the host to run the playbook against.                                  | false    |

e.g.:

```console
CHAIN_ID=cosmoshub-4 \
PASSWORD='p455w0rd!' \
SNAPSHOT_URL=https://example.com/snapshot.tar.lz4 \
MONIKER=my-node \
DD_API_KEY=0gD04PXCnLk0CYNHdamJ7lylKs5uMZkJ \
TARGET=1.2.3.4 \
RPC_HOSTNAME=rpc.example.com \ 
API_HOSTNAME=api.example.com \
PROVIDER=ovhcloud \
make rpc-setup
```

## Register additional hostnames

There will be times when you will want to add additional RPC/API hostnames to a given RPC server:

```console
CHAIN_ID=<chain_id> \
RPC_HOSTNAME=<rpc_hostname> 
API_HOSTNAME=<api_hostname> \
TARGET=<target> \
make rpc-register
```

where:

| Param            | Description                                                 | Required |
|------------------|-------------------------------------------------------------|----------|
| `<chain_id>`     | The chain to setup (e.g.: `cosmoshub-4`).                   | true     |
| `<rpc_hostname>` | The default FQDN that Nginx will respond to RPC queries on. | true     |
| `<api_hostname>` | The default FQDN that Nginx will respond to API queries on. | true     |
| `<target>`       | The IP address of the host to run the playbook against.     | false    |

e.g.:

```console
CHAIN_ID=cosmoshub-4 \
RPC_HOSTNAME=rpc.example2.com \ 
API_HOSTNAME=api.example2.com \
TARGET=1.2.3.4 \
make rpc-register
```

## Upgrades

To upgrade the binary of a rpc node prior to the upgrade height:

1. Ensure the chain details in `group_vars/` have been updated with the version you want to upgrade to.

2. Run the upgrade:

```console
CHAIN_ID=<chain_id> \
TARGET=<target> \
make rpc-upgrade
```

where:

| Param        | Description                                             | Required |
|--------------|---------------------------------------------------------|----------|
| `<chain_id>` | The chain to setup (e.g.: `cosmoshub-4`).               | true     |
| `<target>`   | The IP address of the host to run the playbook against. | false    |

e.g.:

```console
CHAIN_ID=cosmoshub-4 \
TARGET=1.2.3.4 \
make rpc-upgrade
```
