#Pre Requisities
#* Docker desktop
#   Enable Kubernetes


### From Windows command line or terminal in Mac
#
# Setup Kubernetes dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml

?????  Need to make this permanent not proxy
# Start proxy
## You can stop it after running helm
kubectl proxy

#Install helm
# https://helm.sh/docs/


# GEt helm
# ALL
#https://github.com/helm/helm/releases
# Windows 
#https://get.helm.sh/helm-v3.0.0-beta.3-windows-amd64.zip


# Create namespace (File provided)
kubectl apply -f spark-operator.json


# Deploy Spark Operator Kubernetes packages
c:\tmp\helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
c:\tmp\helm install incubator/sparkoperator --generate-name --namespace spark-operator --set sparkJobNamespace=default

## NOT NEEDED?
kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default


# Build an updated image to run operator
#docker build -t . mlops/sparkk8s

kubectl get sparkapplications -o json


kubectl get serviceaccounts
# Make not of the sparkoprator-xxxxxx-spark name

## Edit spark-pi.yaml
## Change the service account line value to the value you got in the previous command
kubectl apply -f spark-pi-driveronly.yaml
kubectl delete -f spark-pi-driveronly.yaml


#Monitor application 
kubectl get pods
# Driver and workers show when running 

kubectl get sparkapplications -o json
# Execution details 
# Watch state under status

kubectl logs spark-pi-driver -f
#watch the job execution