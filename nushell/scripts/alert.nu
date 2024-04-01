export def main [
    command: closure   # the command to spawn
] {
  if (not ("~/.pushover-cli.conf" | path exists) ) {
    return (error make {msg: "~/.pushover-cli.conf does not exist"})
  }
  try {
    do $command
    pushover-cli "SUCCESS"
  } catch {
    pushover-cli "FAIL"
  }
}

export def wait [
  pid: int
] {
  if (not ("~/.pushover-cli.conf" | path exists) ) {
    return (error make {msg: "~/.pushover-cli.conf does not exist"})
  }
  let info = (ps -l | where pid == $pid | get 0)
  bash -c $"lsof -p ($pid) +r 1 &>/dev/null"
  pushover-cli $"FINISHED ($info.command)"
}
