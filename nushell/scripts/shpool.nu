export def main [
    remote_machine: string, # the host to ssh to
    session_name: string,   # which shpool session to connect to
    --forward: list<string> # local_port:address:port
] {
  let forward_args = ($forward | default [] | each {|it| ["-L", $it]} | flatten)
  let command = $"-oRemoteCommand=$HOME/.cargo/bin/shpool -D attach -f ($session_name)" 
  autossh -M 0 ...$forward_args -t $command $remote_machine
}

