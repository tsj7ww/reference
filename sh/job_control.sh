###################
### JOB CONTROL ###
###################
sleep 20 # ^C -> signals interrupt with SIGINT
man signal #
# import signal \ def handler(signum, time): print("Got SIGINT, continuing.")
# signal.signal(signal.SIGINT, handler) -> handler SIGINT
nohup sleep 2000 & # sleep for 2k secs in background + ignore hangup
jobs # list jobs
bg %1 # bring pid=1 to background
fg %1 # bring pid=1 to foreground
kill -STOP %1 # send stop signal to pid