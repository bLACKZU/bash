#Fetch PPID, STATS from ps table. Kill the parent process(zombie processes already dead you cant kill them). 
#xargs takes the input from standard output of the previous commands and feed it to kill cmd. With -r (or --no-run-if-empty): xargs won’t run the command at all if the input list is empty. 
ps -eo pid,ppid,stat | grep -i Z | awk '{print $2'}' | xargs -r kill
