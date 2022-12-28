# Pupmos/ansible-cosmos-nodes

Ansible playbooks for setting up new Cosmos validators and RPC/gRPC/API nodes.

## Prerequisites

- [Python3](https://realpython.com/installing-python)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

_Ideally ansible should be installed via [pip](https://pip.pypa.io/en/stable/), the package installer for python._

## Assumptions

This README assumes that you've already installed `debian` or `ubuntu` onto the target environment/s.

## Setup

1. Install the required git submodule dependencies:

```console
git submodule update --init
```

2. Install the ansible `community.general` collection:

```console
ansible-galaxy collection install community.general
```

3. Rename the `hosts.example` file in `inventory/` to `hosts`:

```console
cp inventory/hosts.example inventory/hosts
```

4. Edit the file `inventory/hosts` as you see fit, by adding the IP addresses of your node/s to the corresponding chain IDs. 

## Types

The following types are supported:

- [RPC](RPC.md)
- [Validator](VALIDATOR.md)

## Todo
 
- Automate the installation of Steward on Sommelier nodes.
- Full support for [nomic](https://github.com/nomic-io/nomic).
- Support for [tmkms](https://github.com/tendermint/tmkms) and [horcrux](https://github.com/strangelove-ventures/horcrux).
