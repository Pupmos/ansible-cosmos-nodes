DD_API_KEY?=''
TARGET_OPTS?=

ifdef TARGET
	TARGET_OPTS = '-l $(TARGET)'
endif

ifndef RESTART_COSMOVISOR
	RESTART_COSMOVISOR=false
endif

ifndef NODE_TYPE
	NODE_TYPE='default'
endif

ifdef DB_BACKEND
	DB_BACKEND_OPTS='db_backend=$(DB_BACKEND)'
endif

validator-setup:
	@ansible-playbook -i inventory/hosts -e 'target=$(CHAIN_ID) password=$(PASSWORD) snapshot_url=$(SNAPSHOT_URL) moniker=$(MONIKER) dd_api_key=$(DD_API_KEY) provider=$(PROVIDER) $(DB_BACKEND_OPTS)' $(TARGET_OPTS) validator_setup.yml

validator-upgrade:
	@ansible-playbook -i inventory/hosts -e 'target=$(CHAIN_ID) node_type=default restart_cosmovisor=$(RESTART_COSMOVISOR) $(DB_BACKEND_OPTS)' $(TARGET_OPTS) node_upgrade.yml

rpc-setup:
	@ansible-playbook -i inventory/hosts -e 'target=$(CHAIN_ID) password=$(PASSWORD) snapshot_url=$(SNAPSHOT_URL) moniker=$(MONIKER) dd_api_key=$(DD_API_KEY) rpc_hostname=$(RPC_HOSTNAME) api_hostname=$(API_HOSTNAME) provider=$(PROVIDER)' $(TARGET_OPTS) rpc_setup.yml

rpc-register:
	@ansible-playbook -i inventory/hosts -e 'target=$(CHAIN_ID) rpc_hostname=$(RPC_HOSTNAME) api_hostname=$(API_HOSTNAME)' $(TARGET_OPTS) rpc_register.yml

rpc-upgrade:
	@ansible-playbook -i inventory/hosts -e 'target=$(CHAIN_ID) node_type=rpc restart_cosmovisor=$(RESTART_COSMOVISOR)' $(TARGET_OPTS) node_upgrade.yml

node-basic:
	@ansible-playbook -i inventory/hosts -e 'target=$(CHAIN_ID) password=$(PASSWORD) dd_api_key=$(DD_API_KEY) node_type=$(NODE_TYPE) provider=$(PROVIDER)' $(TARGET_OPTS) node_basic.yml
