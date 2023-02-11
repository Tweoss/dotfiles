#!/Users/francischua/.cargo/bin/nu

let stderr = (do { /usr/bin/open (["file://", (pbpaste | str replace -a ' ' '%20')] | str join) -a Arc } | complete).stderr;
if $stderr != "" {
  echo $stderr;
  osascript -e $'display notification "($stderr | str replace -a '"' '\\"')" with title "Unable to open in Arc" sound name "Purr"'

}
