***

* GDB commands
```bash
Apply gdb on binary which has been compiled using the -g option to enable gdb logs.

start :- To start the program execution.

run :- executes the entire program/ stops at break point.

info break :-  To get the info of break points set.

break #lineNo :- To set break at particular line of given program.

del break #no :- To delete break points.

pwd :- works from gdb to show the working directory.

list :- shows neighbouring code of current line.

step :-  executes one command at a time including sub routine calls.
next :-  executes one command at a time excluding sub routine calls.

stepi :- same as step but in machine level.
nexti :- same as next but in machine level.

print #var / p #var :- prints variable value.

watch #var :- To watch the changes in variables.

info watch / info watchpoints :- To get the info of watch points set.

del #watchNo :- To delete watchpoints
```
```bash
To use container with gdb     ---> --cap-add=SYS_PTRACE --security-opt seccomp=unconfined
```

***

* Screen commands
```bash
To check existed screens      ---> screen ls
Save screen session with name ---> screen -S #session_name
Resume screen                 ---> screen -r #screen_id
```

***
