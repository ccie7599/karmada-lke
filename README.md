# Multi-cluster, multi-region, multi-cloud Kubernetes

This project helps you bootstrap and orchestrate several Kubernetes clusters across different LKE regions from a single control plane.

The script is written to use minimal compute resources, please do not modify this. 

# Prerequisites 

- Linode Account
- Akamai Account (for GTM integration)
- kubectl installed locally - https://kubernetes.io/docs/tasks/tools/#kubectl

# Current Issues

- ~~Karmada is not propagating the ConfigMap volume (needed for nginx config) to the clusters. This requires a manual application to each cluster.~~. SOLVED! Need to enable the PropagateDeps feature in the Karmada controller manager as described here - https://karmada.io/docs/userguide/scheduling/propagate-dependencies/#enable-propagatedeps-feature - updated instructions to include that step. 

- On Step 3 of the terraform apply, the Istio mesh is running into terraform installation errors on the cluster. This is affecting Kiali visibility and reports unless the terraform command is repeated until success. The original author of the exercise makes note of this on the very bottom of this README.

- As the hardware is by default 4GB shared Linodes, the terraform steps, in particular the helm chart applications, will occasionally time out. If a terraform command ends in error, run it again.

# To-Do List

- Build an terraform file to auto-load the GTM hostnames into a GTM property.

- Build a better sample deployment app.

- Fix Problems above.

# Usage once configured

Karmada core concept details can be found at karmada.io. A master cluster (kubeconfig=karmada-config) maintains workload scheduling across the worker clusters (kubeconfig=kubeconfig-{us|eu|jp|uk|sg|jp|au}). Applications and services can be deployed directly to the master cluster, along with a declarative policy file, and the master cluster will schedule the pods and services as requested. Manifests are applied via-
```
kubectl apply -f {manifest.yml} --kubeconfig=karmada-config
```
Similarly, information on deployments and services can be queried directly from the master cluster for the entire multi-cluster deployment-
```
kubectl get {deployments|services} --kubeconfig=karmada-config
```

# Diagram
![Scaling Kubernetes clusters across regions and clouds](assets/preview.gif)

## Getting started

You need to create a Linode token to access the API:

```
linode-cli profile token-create
export LINODE_TOKEN=<insert the token here>
```

```
# Create the clusters
terraform -chdir=01-clusters init
terraform -chdir=01-clusters apply -auto-approve

# Install Karmada in the cluster manager
terraform -chdir=02-karmada init
terraform -chdir=02-karmada apply -auto-approve

# Configure the Karmada workers 
terraform -chdir=03-workers init
terraform -chdir=03-workers apply -auto-approve

# Install Prometheus
terraform -chdir=04-prometheus init
terraform -chdir=04-discovery apply -auto-approve


# Clean up (once done and you want to destroy the clusters)
terraform -chdir=04-prometheus destroy -auto-approve
terraform -chdir=03-workers destroy -auto-approve
terraform -chdir=02-karmada destroy -auto-approve
terraform -chdir=01-clusters destroy -auto-approve
```

## Enabling Propogating Dependency Replication

Karmada can automatically deploy dependicies to deployments/services (such as ConfigMaps and Secrets). This needs to be first enabled in the cluster manager. To do so, run the following command:
```
kubectl edit deployment karmada-controller-manager -n karmada-system --kubeconfig=kubeconfig-cluster-manager
```
within ```spec.containers.command``` in the file, add a line-
```
        - --feature-gates=PropagateDeps=true
```
Once the feature is enabled in the Karmada cluster, it can be used by adding ```spec.propagationDeps: true``` to the policy file. The sample policy.yml included in the repository has an example of this.

## Deploying a test Service

A sample nginx deployment and load balancer service yaml are included. To deploy, apply the yml via kubectl:
```
kubectl apply -f hw.yml --kubeconfig=karmada-config
```
You will also need to deploy a Karmada policy file to set load balancing and cluster deployment rules for the nginx deployment. To apply the sample file, use kubectl:
```
kubectl apply -f policy.yml --kubeconfig=karmada-config
```
Once the deployment and application are applied, the included get-gtm.sh script can extract load balancer IPs to a gtm_hostnames CSV. To run the script, use:
```
./get-gtm.sh
```
## Notes

- This Terraform files use the `null_resource` and `kubectl`. You should have `kubectl` installed locally.
