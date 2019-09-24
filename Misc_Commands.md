
## 1. GDB commands
```bash
Apply gdb on binary which has been compiled using the -g option to enable gdb logs.

start :- To start the program execution.

run :- executes the entire program/ stops at break point.

info break :-  To get the info of break points set.

break <lineNo> :- To set break at particular line of given program.

del break <no> :- To delete break points.

pwd :- works from gdb to show the working directory.

list :- shows neighbouring code of current line.

step :-  executes one command at a time including sub routine calls.
next :-  executes one command at a time excluding sub routine calls.

stepi :- same as step but in machine level.
nexti :- same as next but in machine level.

print <var> / p <var> :- prints variable value.

watch <var> :- To watch the changes in variables.

info watch / info watchpoints :- To get the info of watch points set.

del <watchNo> :- To delete watchpoints
```
```bash
Use container with gdb      --->  --cap-add=SYS_PTRACE --security-opt seccomp=unconfined
```

***

## 2. Screen commands
```bash
Check existed screens         ---> screen ls

Save screen session with name ---> screen -S <session_name>

Resume screen                 ---> screen -r <screen_id>
```

***

## 3. Docker commands
```bash
Pull an image from repo        ---> docker pull <image_name:tag>

Check docker network           ---> docker network ls

Save a container as image      ---> docker commit <container_id> <image_name>

Check container details        ---> docker inspect <container_name>

Save docker images as tar ball ---> docker save --output <image_name.tar> <image_name>

Load image from tar ball       ---> docker load < <image_name.tar>

Copy contents from host to container or vice versa  ---> docker cp <source_path> <container_name:/desti_path>

Provides information about the disk space occupied by your containers, images, volumes etc  ---> docker system df 

Helps to remove all the unused containers, volumes and dangling images  ---> docker system prune

Information about the history of images / layers used to build the same ---> docker image history <image_name>

To build docker image without using cache	---> Docker build –no-cache 
```

## 4. Linux commands
```bash
Get full path of a file ---> Readlink <file_name>

Find socket files       ---> sudo find / -type s

Format go files         ---> Go fmt <filename>
```

### a. Firewall commands
```bash
Status  ---> systemctl status firewalld.service  #(RHEL/SLES) --->  systemctl status ufw  #(Ubuntu)

Start   ---> systemctl start firewalld.service   #(RHEL/SLES) --->  systemctl start ufw   #(Ubuntu)

Stop    ---> systemctl stop firewalld.service    #(RHEL/SLES) --->  systemctl stop ufw    #(Ubuntu)

Enable  ---> systemctl enaable firewalld.service #(RHEL/SLES) --->  systemctl enaable ufw #(Ubuntu)

Disable ---> systemctl disable firewalld.service #(RHEL/SLES) --->  systemctl disable ufw #(Ubuntu)
```
### b. Git commands
```bash
To verify files with specific text in git repo	--->  git grep -l <textToSearch>
```
```
Format (indentation) may gets changed when we copy content to git files, better to add them from CLI by accessing repo using token (settings --> dev settings --> access tokens --> create token) and commit.
```





