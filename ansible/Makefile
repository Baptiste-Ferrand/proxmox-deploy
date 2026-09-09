ANSIBLE_CONFIG := ansible.cfg
export ANSIBLE_CONFIG

PLAYBOOK := playbooks/site.yml
DEV_INV := inventories/dev
PROD_INV := inventories/prod
REQUIREMENTS := requirements.yml
SSH_KEY_PATH ?= ~/.ssh/id_ed25519

DEV_VAULT := $(DEV_INV)/group_vars/vault.yml
PROD_VAULT := $(PROD_INV)/group_vars/vault.yml

HARBOR_TAG := harbor
KUBERNETES_LOAD_BALANCERS_TAG := kubernetes_load_balancers
KUBERNETES_PREREQUISITES_TAG := kubernetes_prerequisites
KUBEADM_INIT_TAG := kubeadm_init
KUBERNETES_CNI_TAG := kubernetes_cni
KUBEADM_CONTROL_PLANE_JOIN_TAG := kubeadm_control_plane_join
KUBEADM_WORKER_JOIN_TAG := kubeadm_worker_join
KUBERNETES_CLUSTER_VALIDATION_TAG := kubernetes_cluster_validation
ARGOCD_BOOTSTRAP_TAG := argocd_bootstrap
LONGHORN_PREREQUISITES_TAG := longhorn_prerequisites
WIREGUARD_GATEWAY_TAG := wireguard_gateway

.PHONY: help install dev prod check-dev check-prod syntax-dev syntax-prod ping-dev ping-prod lint \
	check-harbor-dev deploy-harbor-dev \
	check-kubernetes-load-balancers-dev deploy-kubernetes-load-balancers-dev \
	check-kubernetes-prerequisites-dev deploy-kubernetes-prerequisites-dev\
	check-kubeadm-init-dev deploy-kubeadm-init-dev \
	check-kubernetes-cni-dev deploy-kubernetes-cni-dev \
	check-kubeadm-control-plane-join-dev deploy-kubeadm-control-plane-join-dev \
	check-kubeadm-worker-join-dev deploy-kubeadm-worker-join-dev \
	check-kubernetes-cluster-validation-dev deploy-kubernetes-cluster-validation-dev \
	check-argocd-bootstrap-dev deploy-argocd-bootstrap-dev \
	check-longhorn-prerequisites-dev deploy-longhorn-prerequisites-dev \
	check-wireguard-gateway-dev deploy-wireguard-gateway-dev

help:
	@echo "Ansible commands"
	@echo "  make install"
	@echo "  make dev SSH_KEY_PATH=..."
	@echo "  make prod SSH_KEY_PATH=..."
	@echo "  make check-dev"
	@echo "  make check-prod"
	@echo "  make syntax-dev"
	@echo "  make syntax-prod"
	@echo "  make ping-dev"
	@echo "  make ping-prod"
	@echo "  make lint"
	@echo "  make check-harbor-dev"
	@echo "  make deploy-harbor-dev"
	@echo "  make check-kubernetes-load-balancers-dev"
	@echo "  make deploy-kubernetes-load-balancers-dev"
	@echo "  make check-kubernetes-prerequisites-dev"
	@echo "  make deploy-kubernetes-prerequisites-dev"
	@echo "  make check-kubeadm-init-dev"
	@echo "  make deploy-kubeadm-init-dev"
	@echo "  make check-kubernetes-cni-dev"
	@echo "  make deploy-kubernetes-cni-dev"
	@echo "  make check-kubeadm-control-plane-join-dev"
	@echo "  make deploy-kubeadm-control-plane-join-dev"
	@echo "  make check-kubeadm-worker-join-dev"
	@echo "  make deploy-kubeadm-worker-join-dev"
	@echo "  make check-kubernetes-cluster-validation-dev"
	@echo "  make deploy-kubernetes-cluster-validation-dev"
	@echo "  make check-argocd-bootstrap-dev"
	@echo "  make deploy-argocd-bootstrap-dev"
	@echo "  make check-longhorn-prerequisites-dev"
	@echo "  make deploy-longhorn-prerequisites-dev"
	@echo "  make check-wireguard-gateway-dev"
	@echo "  make deploy-wireguard-gateway-dev"

install:
	ansible-galaxy role install -r $(REQUIREMENTS)
	ansible-galaxy collection install -r $(REQUIREMENTS)

dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) --private-key $(SSH_KEY_PATH)

prod:
	ansible-playbook -i $(PROD_INV) $(PLAYBOOK) --private-key $(SSH_KEY_PATH)

check-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) --check --diff --private-key $(SSH_KEY_PATH)

check-prod:
	ansible-playbook -i $(PROD_INV) $(PLAYBOOK) --check --diff --private-key $(SSH_KEY_PATH)

syntax-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) --syntax-check

syntax-prod:
	ansible-playbook -i $(PROD_INV) $(PLAYBOOK) --syntax-check

ping-dev:
	ansible all -i $(DEV_INV) -m ping --private-key $(SSH_KEY_PATH)

ping-prod:
	ansible all -i $(PROD_INV) -m ping --private-key $(SSH_KEY_PATH)

lint:
	ansible-lint

encrypt-dev:
	ansible-vault encrypt $(DEV_VAULT)

decrypt-dev:
	ansible-vault decrypt $(DEV_VAULT)

view-dev:
	ansible-vault view $(DEV_VAULT)

encrypt-prod:
	ansible-vault encrypt $(PROD_VAULT)

decrypt-prod:
	ansible-vault decrypt $(PROD_VAULT)

view-prod:
	ansible-vault view $(PROD_VAULT)

list-tags-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) --list-tags

check-harbor-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(HARBOR_TAG) \
		--check --diff \
		--private-key $(SSH_KEY_PATH)

deploy-harbor-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(HARBOR_TAG) \
		--private-key $(SSH_KEY_PATH)

check-kubernetes-load-balancers-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBERNETES_LOAD_BALANCERS_TAG) \
		--check --diff \
		--private-key $(SSH_KEY_PATH)

deploy-kubernetes-load-balancers-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBERNETES_LOAD_BALANCERS_TAG) \
		--private-key $(SSH_KEY_PATH)

check-kubernetes-prerequisites-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBERNETES_PREREQUISITES_TAG) \
		--check --diff \
		--private-key $(SSH_KEY_PATH)

deploy-kubernetes-prerequisites-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBERNETES_PREREQUISITES_TAG) \
		--private-key $(SSH_KEY_PATH)

check-kubeadm-init-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBEADM_INIT_TAG) \
		--check --diff \
		--private-key $(SSH_KEY_PATH)

deploy-kubeadm-init-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBEADM_INIT_TAG) \
		--private-key $(SSH_KEY_PATH)

check-kubernetes-cni-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBERNETES_CNI_TAG) \
		--check --diff \
		--private-key $(SSH_KEY_PATH)

deploy-kubernetes-cni-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBERNETES_CNI_TAG) \
		--private-key $(SSH_KEY_PATH)

check-kubeadm-control-plane-join-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBEADM_CONTROL_PLANE_JOIN_TAG) \
		--check --diff \
		--private-key $(SSH_KEY_PATH)

deploy-kubeadm-control-plane-join-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBEADM_CONTROL_PLANE_JOIN_TAG) \
		--private-key $(SSH_KEY_PATH)

check-kubeadm-worker-join-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBEADM_WORKER_JOIN_TAG) \
		--check --diff \
		--private-key $(SSH_KEY_PATH)

deploy-kubeadm-worker-join-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBEADM_WORKER_JOIN_TAG) \
		--private-key $(SSH_KEY_PATH)

check-kubernetes-cluster-validation-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBERNETES_CLUSTER_VALIDATION_TAG) \
		--check --diff \
		--private-key $(SSH_KEY_PATH)

deploy-kubernetes-cluster-validation-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(KUBERNETES_CLUSTER_VALIDATION_TAG) \
		--private-key $(SSH_KEY_PATH)

check-argocd-bootstrap-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(ARGOCD_BOOTSTRAP_TAG) \
		--check --diff \
		--private-key $(SSH_KEY_PATH)

deploy-argocd-bootstrap-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(ARGOCD_BOOTSTRAP_TAG) \
		--private-key $(SSH_KEY_PATH)

check-longhorn-prerequisites-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(LONGHORN_PREREQUISITES_TAG) \
		--check --diff \
		--private-key $(SSH_KEY_PATH)

deploy-longhorn-prerequisites-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(LONGHORN_PREREQUISITES_TAG) \
		--private-key $(SSH_KEY_PATH)

check-wireguard-gateway-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(WIREGUARD_GATEWAY_TAG) \
		--check --diff \
		--private-key $(SSH_KEY_PATH)

deploy-wireguard-gateway-dev:
	ansible-playbook -i $(DEV_INV) $(PLAYBOOK) \
		--tags $(WIREGUARD_GATEWAY_TAG) \
		--private-key $(SSH_KEY_PATH)