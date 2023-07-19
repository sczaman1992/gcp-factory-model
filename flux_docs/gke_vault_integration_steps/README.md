# Vault Integration with Kubernetes - Steps:

## Install Hashicorp from Helm Repo

Follow below steps to install hashicorp vault on the cluster:

> helm repo add hashicorp https://helm.releases.hashicorp.com

> helm repo update

> helm install vault hashicorp/vault --set "server.dev.enabled=true"

Vault should be running after complete above steps.
Same can be verify with the below command:

> Kubectl get pods

## Create a secret in the vault
> kubectl exec -it vault-0 -- /bin/sh

> vault secrets enable -path=internal kv-v2

> vault kv put internal/database/config username="db-readonly-username" password="db-secret-password"

once done check the KV with below command:
> vault kv get internal/database/config

## Configure Kubernetes authentication
Kubernetes authentication can done with vault using below commands:

> kubectl exec -it vault-0 -- /bin/sh

> vault auth enable Kubernetes
> vault write auth/kubernetes/config kubernetes_host=https://$KUBERNETES_PORT_443_TCP_ADDR:443

## Create Vault Policy
Vault policy can be done with below commands:

> vault policy write internal-app - <<EOF
path "internal/data/database/config" {
   capabilities = ["read"]
}
EOF

## Create Kubernetes authentication role

> vault write auth/kubernetes/role/internal-ap \\ 
bound_service_account_names=internal-app \\
bound_service_account_namespaces=default \\ 
policies=internal-app ttl=24h


exit from the shell
> exit

## Configure Kubernetes and deploy application

> kubectl create sa internal-app

Deployment file and patch file in the same path..

[Deployment file](https://github.com/gcp-coe/terraform-gcplz-modules/blob/a7b54c2a932a5bcf6ab85d677cb15f968fa8b843/modules/gke-vault-integration-steps/deployment-orgchart.yaml)

[patch file](https://github.com/gcp-coe/terraform-gcplz-modules/blob/a7b54c2a932a5bcf6ab85d677cb15f968fa8b843/modules/gke-vault-integration-steps/patch-inject-secrets.yaml)

> kubectl apply --filename deployment-orgchart.yaml

> kubectl patch deployment orgchart --patch "$(cat patch-inject-secrets.yaml)"


## Check the vault deployment status

> kubectl logs $(kubectl get pod -l app=orgchart -o jsonpath="{.items[0].metadata.name}") --container vault-agent

## Check the secrets in the App Container

> kubectl exec $(kubectl get pod -l app=orgchart -o jsonpath="{.items[0].metadata.name}") --container orgchart -- cat /vault/secrets/database-config.txt

