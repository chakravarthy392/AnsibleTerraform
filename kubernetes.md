## Install k8s on s390x:

```bash
export WORK_DIR=`pwd`
cd $WORK_DIR
wget https://storage.googleapis.com/golang/go1.11.5.linux-s390x.tar.gz 
chmod ugo+r go1.11.5.linux-s390x.tar.gz
tar -xzf go1.11.5.linux-s390x.tar.gz
export GOPATH=$WORK_DIR
export GOROOT=$WORK_DIR/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
go version
```
```bash
sudo apt-get install -y git make iptables gcc wget tar flex subversion binutils-dev bzip2 build-essential vim 
cd $GOPATH
wget https://dl.k8s.io/v1.13.5/kubernetes-server-linux-s390x.tar.gz
tar -xvf kubernetes-server-linux-s390x.tar.gz
export PATH=$GOPATH/kubernetes/server/bin/:$PATH 
export ETCD_UNSUPPORTED_ARCH=s390x
ln -fs $GOPATH/kubernetes/server/bin/kubelet /usr/bin/kubelet
  

###Install cri if cni doesnt provide all binaries (https://github.com/linux-on-ibm-z/docs/wiki/Building-cri-1.11.x -- upto   make install.deps)
cd $WORK_DIR
mkdir -p /opt/cni/bin
mkdir -p /etc/cni/net.d

wget https://github.com/containernetworking/plugins/releases/download/v0.7.5/cni-plugins-s390x-v0.7.5.tgz
wget https://github.com/containernetworking/cni/releases/download/v0.6.0/cni-s390x-v0.6.0.tgz
tar -xzvf cni-plugins-s390x-v0.7.5.tgz -C /opt/cni/bin
tar -xzvf cni-s390x-v0.6.0.tgz -C /opt/cni/bin
```  

  * vim /etc/systemd/system/kubelet.service
```bash
[Unit]
Description=Kubernetes Kubelet
Documentation=https://github.com/kubernetes/kubernetes

[Service]
ExecStartPre=/bin/mkdir -p /etc/kubernetes/manifests
ExecStart=/usr/bin/kubelet \
--kubeconfig=/etc/kubernetes/kubelet.conf \
--root-dir=/scratch/loz/Guirish/k8s_repo \
--pod-manifest-path=/etc/kubernetes/manifests \
--allow-privileged=true \
--cni-conf-dir=/etc/cni/net.d \
--cni-bin-dir=/opt/cni/bin \
--v=4
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
```
 * Extra flags to handle `Disk space` and `Eviction` issues
```bash 
[Unit]
Description=Kubernetes Kubelet
Documentation=https://github.com/kubernetes/kubernetes

[Service]
ExecStartPre=/bin/mkdir -p /etc/kubernetes/manifests
ExecStart=/usr/bin/kubelet \
--kubeconfig=/etc/kubernetes/kubelet.conf \
--image-gc-high-threshold=100 \
--image-gc-low-threshold=100 \
--experimental-allocatable-ignore-eviction=true \
--eviction-hard="memory.available<200Mi,nodefs.available<500Mi,imagefs.available<1Gi" \
--eviction-minimum-reclaim="memory.available=0Mi,nodefs.available=100Mi,imagefs.available=500Mi" \
--root-dir=/scratch/loz/Chakravarthy/Istio1.1.7 \
--pod-manifest-path=/etc/kubernetes/manifests \
--allow-privileged=true \
--network-plugin=cni \
--cni-conf-dir=/etc/cni/net.d \
--cni-bin-dir=/opt/cni/bin \
--cluster-dns=10.96.0.10 \
--cluster-domain=cluster.local \
--v=4
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
```
```bash
cd $GOPATH
export PATH=$GOPATH/kubernetes/server/bin:$PATH
systemctl daemon-reload
kubeadm reset
kubeadm init --pod-network-cidr=10.244.0.0/16
	   
[ swapoff -a && sed -i '/swap/d' /etc/fstab   ---->   to disable swap]
[ kubeadm init --pod-network-cidr=10.244.0.0/16 --ignore-preflight-errors=CRI]
[ go get github.com/kubernetes-incubator/cri-tools/cmd/crictl  ---->   crictl not found in path]
kubeadm config images pull
```


* Installing a pod network (flannel)
   ```bash
   kubectl apply -f kube-flannel.yml 
   kubectl delete -f kube-flannel.yml 
   #kubectl apply -f calico.yaml
   #kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
   kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/a70459be0084506e4ec919aa1c114638878db11b/Documentation/kube-flannel.yml
   export KUBECONFIG=/etc/kubernetes/admin.conf
   ```
* Edit the `kube-flannel.yml` file from https://raw.githubusercontent.com/coreos/flannel/v0.11.0/Documentation/kube-flannel.yml as follows
 
```diff
@@ -47,7 +47,7 @@
     spec:
       hostNetwork: true
       nodeSelector:
-        beta.kubernetes.io/arch: amd64
+        beta.kubernetes.io/arch: s390x
       tolerations:
       - key: node-role.kubernetes.io/master
         operator: Exists
@@ -55,7 +55,7 @@
       serviceAccountName: flannel
       containers:
       - name: kube-flannel
-        image: quay.io/coreos/flannel:v0.8.0-amd64
+        image: quay.io/coreos/flannel:v0.8.0-s390x
         command: [ "/opt/bin/flanneld", "--ip-masq", "--kube-subnet-mgr" ]
         securityContext:
           privileged: true
@@ -74,7 +74,7 @@
         - name: flannel-cfg
           mountPath: /etc/kube-flannel/
       - name: install-cni
-        image: quay.io/coreos/flannel:v0.8.0-amd64
+        image: quay.io/coreos/flannel:v0.8.0-s390x
         command: [ "/bin/sh", "-c", "set -e -x; cp -f /etc/kube-flannel/cni-conf.json /etc/cni/net.d/10-flannel.conf; while true; do sleep 3600; done" ]
         volumeMounts:
         - name: cni
``` 


To start using your cluster, you need to run (as a regular user):
```bash
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
```

you can confirm that it is working by checking that the kube-dns pod is Running in the output of `kubectl get pods --all-namespaces`

 
* Tainting nodes :
```bash
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl apply taint --all node.kubernetes.io/disk-pressure-
```
 
 
* Change image tags in yaml file / images on VM
* Some basic commands:
```bash
To check services run - kubectl get services
To check deployment run - kubectl get deployments
To delete services run - kubectl delete svc <service-name>
To delete deployment run - kubectl delete deployment <deployment-name>
   kubectl get nodes
   kubectl describe nodes
   kubectl get pods --all-namespaces
   kubectl get services
   kubectl get services --all-namespaces
   kubectl describe pod <podName> -n <nameSpace>
   kubectl get deployment --all-namespaces -n kube-system
   kubectl get services --all-namespaces
   kubectl get deployments --all-namespaces
   kubectl describe deployment calico-kube-controllers -n kube-system
   kubectl describe node #nodeName
   kubectl get pod <podName> -n <nameSpace> -o yaml
   kubectl get events
```

 
