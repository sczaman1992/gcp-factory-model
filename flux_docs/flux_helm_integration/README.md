# Flux - Step by step procedure to automate helmchart updates 

#### 1.	Need to complete bootstrap steps for flux before starting further steps,
 
> export GITHUB_TOKEN=`<github token created from above step 7>`
> export GITHUB_USER=`<github username>`
 
> flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=flux-demo-test1 \
  --branch=main \
  --path=clusters/flux-demo-cluster \
  --personal
 
#### 2.	Create Kubernetes secret to connect with source repo,
 
Using the Flux CLI, create an SSH secret for your forked deployment repo where your actual deployment files consists,
    substituting your GitHub account name in the appropriate place.
 
> flux create secret git `<secret name>` \
  --url=ssh://github.com/`<git username>`/`<git repo name>` \
  --namespace=`<namespace name where secret should copied in GKE cluster>`
 
Important Note: Make a note on deploy key generated, which will be copied to github repo in next steps.
 
you can verify the secrete by below command,
> kubectl get secrets flux-demo-deploy-auth -o yaml -n flux-kube-demo| yq '.data'
 
Add created deploy key to github repo and add trust between flux and github repo,
 
repo >> settings >> deploy key >> add deploy key >> enter below deploy key.>> select allow write access.
 
Note: above operation will create a deployment repo access for flux.
 
#### 3.	Create trust connectivity between source repo with flux to download the helm chart,
 
> flux create source git `<git source repo alias>` \
--url=ssh://github.com/`<git username>/<repo name>` \
--branch=`<branch name>` \
--secret-ref=`<secret name created on step 2>` \
--namespace=`<namespace source should create>`
 
#### 4.	Create helm releases with the updates on source created on step 3,
 
> flux create helmrelease `<helm release name>` \
  --source=gitrepository/`<git source repo alias>` \
  --chart=`<chart name on the index.yaml file in repo>` \
  --namespace=`<namespace where helm chart need to be deployed>`


Note: Added github action workflow.yaml file in the same directory which will create automated helm chart package incase any changes on the helm chart and update index.yaml automatically.