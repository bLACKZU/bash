# Scenario
# Users are complaining about slow file access. System metrics show high disk utilization.

# Task
# Reduce I/O activity of top offender using I/O priorities to idle. Keep critical jobs (databases, message queues, applications) at high priority.

#Check I/O usage in real-time
 ~ sudo iotop -o -b -n 10  

 #Change priority of non-critical workloads
 ~ sudo ionice -c 3 -p <pid> #3 -> idle class, only gets I/O when others dont need it, 2 -> best-effort class(default for most workloads), 1 -> highest priorty, starves other workloads, 0 -> no priority
