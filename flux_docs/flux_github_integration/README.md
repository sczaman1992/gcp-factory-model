# Step by Step Procedure to implement Flux on GKE cluster: 
---
Note: Below installation steps followed for Debian instance

## Step 1:

Create a GKE Cluster
> gcloud container clusters create my-cluster --zone us-central1-a --node-locations uscentral1-c,us-central1-b
 
## Step 2:

Create a GCE in the same VPC of the Kubernetes Cluster
Note: Need to provide full access to the cloud API for the GCE 
 
## Step 3:

Connect to GCE instance using ssh and install below mentioned components (some of them are optional) which is useful to configure Flux:
 
## Components lists to install:

### 1.	Gcloud 
gcloud will be already installed if you are using cloud shell, otherwise install using below:
 
> sudo apt-get update && sudo apt-get install google-cloud-cli

> gcloud auth login     //Once installation completed, login using this command
 
Ref: https://cloud.google.com/sdk/docs/install-sdk#deb
 
### 2.	Kubectl 
To manage GKE cluster, you may need to install kubectl 
 
> gcloud components install kubectl

> kubectl version
 
Ref: https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl
 
 
### 3.	 gke-gcloud-auth-plugin  
To authenticate with GKE cluster.
 
> gcloud components install gke-gcloud-auth-plugin

> gke-gcloud-auth-plugin --version
 
Ref: https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl
 
### 4.	Flux V2 
Flux cd installation with flux cli
 
> curl -s https://fluxcd.io/install.sh | sudo bash
 
Ref: https://fluxcd.io/flux/installation/
Note: GCE SA should have Kubernetes admin privilege to install flux.
 
### 5.	Yq
helpful to grep specific info from output:
 
> sudo apt-get update

> sudo wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64

> sudo chmod a+x /usr/local/bin/yq
 
Ref: https://mikefarah.gitbook.io/yq/v/v3.x/
 
### 6.	gh (optional)
github cli 
 
> sudo apt install gh

> gh auth login      //to authenticate with github
 
### 7.	tree (Optional)
installation component which will help to show the tree structure for directories.
 
> sudo apt install tree
 
### 8.	git (optional)
git cli
 
> sudo apt install git-all
 
> git config --global user.email "email address"

> git config --global user.name "username"
 
### 9.	kustomize
To create kustomization files automatically.
 
> curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

> sudo mv kustomize /usr/local/bin/
 
 
## Step 4:
Connect to the cluster from the flux server:
 
> gcloud container clusters get-credentials `<GKE cluster name>` \
    --region=<cluster's region>
 
## Step 5:

Check that the GitOps Toolkit components have started up correctly in the cluster. There should be a pod running for each of the toolkit components.
 
> kubectl -n flux-system get all
 
 
## Step 6:

Check that your Kubernetes environment is suitable for Flux by checking the
   prerequisites.
 
> flux check --pre
 
## Step 7:

Create a Fine grained personal access token for Github repo.
#### provide the below accesses:
Read access to metadata
Read and Write access to actions, actions variables, administration, code, codespaces, codespaces lifecycle admin, codespaces secrets, commit statuses, deployments, environments, issues, repository hooks, secrets, and workflows
 
## Step 8:

from GCE console execute the belwow steps to bootdstrap the FluxCD..
 
> export GITHUB_TOKEN=`<github token created from above step 7>`

> export GITHUB_USER=`<github username>`
 
> flux bootstrap github \
            --owner=$GITHUB_USER \
            --repository=flux-demo-test1 \
            --branch=main \
            --path=clusters/flux-demo-cluster \
            --personal
 
Note: Above operation will create a new repo in github with name you have mentioned --repository field and add files under the path directory which will be used for flux. and create a new namespace "flux-system" in cluster and add resources under the same.
 
 
## Step 9:

Using the Flux CLI, create an SSH secret for your forked deployment repo where your actual deployment files consists,
    substituting your GitHub account name in the appropriate place.
 
> flux create secret git `<secret name>` \
  --url=ssh://github.com/`<git username>/<git repo name>` \
  --namespace=`<namespace name where secret should copied in GKE cluster>`
 
Important Note: Make a note on deploy key generated, which will be copied to github repo in next steps.
 
you can verify the secrete by below command,
> kubectl get secrets flux-demo-deploy-auth -o yaml -n flux-kube-demo| yq '.data'
 
## Step 10:

Add created deploy key to github repo and add trust between flux and github repo,
 
repo >> settings >> deploy key >> add deploy key >> enter below deploy key.>> select allow write access.
 
Note: above operation will create a deployment repo access for flux.
 
 
## Step 11:

Used below command and create git clone to local server.
And create two subdirectories under flux repo:
 
> gh auth login
> gh repo clone https://github.com/`<git username>`/`<flux repo name>`.git
 
> cd `<flux repo name>`
> mkdir {sources,kustomizations}
 
## Step 12:

Create the source custom resource for the deployment repo that contains the  Kubernetes manifests for the example application. Remember to substitute your GitHub account name in the command. Inspect the file that is created to make sure it reflects what you expect it to contain.
 
> flux create source git demo-deployment \
  --url=ssh://github.com/`<git username>`/`<deployment repo name>` \
  --branch=`<github repo branch name>` \
  --secret-ref=`<secret name which is created in above step 9>` \
  --namespace=`<name space where your actual deployment should happen>` \
  --export >  `<flux repo name>`/sources/example-source.yaml

> cat  `<flux repo name>`/sources/example-source.yaml
 
## Step 13:

Create the kustomization custom resource for the path in the deployment repo that contains the Kubernetes manifests for the example application. Inspect the file that is created to make sure it reflects what you expect it to contain.
 
> flux create kustomization demo-deployment \
  --source=GitRepository/`<git repo name>.<name space where your actual deployment should happen>` \
  --path=./`<folder name under repo where deployment files present>` \
  --prune=true \
  --target-namespace=`<name space where your actual deployment should happen>` \
  --namespace=`<name space where your actual deployment should happen>` \
  --export > `<flux repo name>`/kustomizations/example-kustomization.yaml
 
 
## Step 14:

Create kustomization files for each of the sub-directories.
 
> cd `<flux repo name>`/sources
> kustomize create --autodetect

> cd `<flux repo name>`/kustomizations
> kustomize create --autodetect
 
Tree will be looks like below.
tree sources/ kustomizations/
 
sources/
├── kustomization.yaml
├── nginxhello-source.yaml
kustomizations/
├── kustomization.yaml
├── nginxhello-kustomization.yaml
 
 
## Step 15:

Push all local repo files to remote repo:
> git add sources/ kustomizations/
> git commi -m ""
> git push
 
Note: After above step, flux should automatically deploy the kustomization and it should lead to create automated deployments from deployment repo.
 
## Step 16: (Only incase automatic deployment has not happened through step 15):

try below commands mannually,
 
> flux create source git demo-deployment \
  --url=ssh://github.com/`<git username>`/`<deployment repo name>` \
  --branch=`<github repo branch name>` \
  --secret-ref=`<secret name which is created in above step 9>`\
  --namespace=`<name space where your actual deployment should happen>`
 
> flux create kustomization demo-deployment \
  --source=GitRepository/`<git repo name>`.`<name space where your actual deployment should happen>` \
  --path=./`<folder name under repo where deployment files present>` \
  --prune=true \
  --target-namespace=`<name space where your actual deployment should happen>` \
  --namespace=`<name space where your actual deployment should happen>`
 
 
## Step 17:
==========
Verify the deployment

> kubectl get all -n `<name space where your actual deployment should happen>`

> kubectl get gitrepositories -A

> kubectl het kustomizations -A
