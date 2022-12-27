# Validator

## Setup

To setup a new validator for a given chain:

```console
CHAIN_ID=<chain_id> \
PASSWORD='<password>' \
SNAPSHOT_URL=<snapshot_url> \
MONIKER=<moniker> \
DD_API_KEY=<dd_api_key> \
PROVIDER=<provider> \
TARGET=<target> \
make validator-setup
```

where:

| Param            | Description                                                                              | Required |
|------------------|------------------------------------------------------------------------------------------|----------|
| `<chain_id>`     | The chain to setup (e.g.: `cosmoshub-4`).                                                | true     |
| `<password>`     | The password for the default user that gets created.                                     | true     |
| `<snapshot_url>` | The snapshot URL to set the node up with (note: only supports `.tar.lz4` and `.tar.gz`). | true     |
| `<moniker>`      | The name that the node will be known by on the network (e.g.: `some-node`).              | true     |
| `<dd_api_key>`   | The DataDog API key.                                                                     | false    |
| `<provider>`     | The datacenter/provider (e.g.: `ovhcloud`).                                              | true     |
| `<target>`       | The IP address of the host to run the playbook against.                                  | false    |

e.g.:

```console
CHAIN_ID=cosmoshub-4 \
PASSWORD='p455w0rd!' \
SNAPSHOT_URL=https://example.com/snapshot.tar.lz4 \
MONIKER=my-node \
DD_API_KEY=0gD04PXCnLk0CYNHdamJ7lylKs5uMZkJ \
PROVIDER=ovhcloud \
TARGET=1.2.3.4 \
make validator-setup
```

Please note that this will not bond the validator - that will need to be performed manually.

## Upgrades

To upgrade the binary of a validator prior to the upgrade height:

1. Ensure the chain details in `group_vars/` have been updated with the version you want to upgrade to.

2. Run the upgrade:

```console
CHAIN_ID=<chain_id> \
TARGET=<target> \
make validator-upgrade
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
make validator-upgrade
```