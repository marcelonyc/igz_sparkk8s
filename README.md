# Running Spark on Kubernetes
MLOps NYC 2019 training session: Runnign Spark on Kubernetes

## Pre Requisities
* Docker desktop with Kubernetes enabled  
To run the demo configure Docker with 3 cpus and 4GB of ram 

### Download all the artifacts from this repository
Make note of the location where you downloaded

### Install components 
From a Windows command line or terminal in Mac

### Confirm Kubernetes is running
*kubetctl get pods*

### Setup Kubernetes dashboard

*kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml*

### Start proxy (on second window)
You can stop it after running helm

*kubectl proxy*

### Install helm
For this setup download the Windows or Mac binary.   
Extract and expand somewhere local.  
Documentation:  https://helm.sh/docs/  
ALL binaries:   https://github.com/helm/helm/releases  
Windows Binary: https://get.helm.sh/helm-v3.0.0-beta.3-windows-amd64.zip  


### Create namespace (File provided)
Go to the location where you downloaded the files from this repository
*kubectl apply -f spark-operator.json*


### Deploy Spark Operator Kubernetes packages

*<Location of heml>\helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator*  
*<Location of heml>\helm install incubator/sparkoperator --generate-name --namespace spark-operator --set sparkJobNamespace=default*  

### Optional
*kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default*

### Configure the Spark application
Get the Spark service account. Make not of the sparkoprator-xxxxxx-spark name

*kubectl get serviceaccounts*


### Edit spark-pi.yaml
Change the serviceAccount line value to the value you got in the previous command

### Run the test application
You must be in the directory where you extracted this repository

*kubectl apply -f spark-pi.yaml*



### Monitor application 
Driver and workers show when running. You should see spark-pi-driver and one worker

*kubectl get pods*

List all Spark applications
*kubectl get sparkapplications*

Detailed list in JSON format Watch state under status

*kubectl get sparkapplications -o json*

Watch the job execution

*kubectl logs spark-pi-driver -f*

Delete the application

*kubectl delete -f spark-pi.yaml*

