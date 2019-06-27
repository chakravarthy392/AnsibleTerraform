
```bash
check forked package in https://github.com/linux-on-ibm-z/<PkgName>
git config --global user.name "Chakravarthy Gopi"
git config --global user.email "cgopi@us.ibm.com"

#### update the master to latest if files are not in sync
 git clone https://github.com/linux-on-ibm-z/etcd
 git clone https://<token_ID>@github.ibm.com/<user_name>/Scripts.git   --- If token required  
  eg:- git clone https://69c345ef7a07b3a1eccdbad19819905fb43d457a@github.ibm.com/cgopi/Scripts.git
 cd /cloned/etcd
 git remote add upstream https://github.com/coreos/etcd
 git fetch upstream
 git pull upstream master
 git push
```
```bash
Username for 'https://github.com': chakravarthy392
Password for 'https://chakravarthy392@github.com':
```
```bash
#### Create a branch from the forked package and made changes to that branch.

git checkout -b s390x-support   #To create a new branch with existing files
#### make changes
git add .
git status
git commit -m "build-docker: Added support for s390x"
git commit -m "Added support for s390x"
git push -u origin s390x-support

#### To add all previous commits into one file and push forcefully
git commit --amend
git push -f
```

