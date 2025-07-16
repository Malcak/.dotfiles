pid-by-port() {
  pid=`lsof -t -i:$1`
  if [ -n "$pid" ]; then
    echo "process PID: " $pid
    ps $pid
  else
    echo "No process found using port $1"
  fi
}