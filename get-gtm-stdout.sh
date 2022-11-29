kubectl get services nginx --kubeconfig=karmada-config -o jsonpath='{.status.loadBalancer.ingress[*].hostname}' |sed  's/\ /,/g' 
