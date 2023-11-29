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
