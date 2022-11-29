kubectl get services nginx --kubeconfig=karmada-config -o jsonpath='{.status.loadBalancer.ingress[*].hostname}' > gtm_hostnames
sed -i '' -e 's/\ /,/g' gtm_hostnames