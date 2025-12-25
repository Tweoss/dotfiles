#!/usr/bin/env nu

export def cal_add [
  base?: string,
  --every: string, # ex: monday and wednesday
  --time: string, # ex: 10:30-11:50
  --location: string, # ex: gates B1
  --starting: string, # ex: january 8
  --until: string, # ex: january 9
  --from-file: path,
] {
  mut base = $base
  mut every = $every
  mut time = $time
  mut location = $location
  mut starting = $starting
  mut until = $until
  if ($from_file != null) {
    let input = cat $from_file | lines
    $base = $'"($input | get 0)"'
    $every = ($input | get 1)
    $time = ($input | get 2)
    $location = ($input | get 3)
    $starting = ($input | get 4)
    $until = ($input | get 5)
  }

  mut text = ($base | str replace --all '"' '\"')
  if ($every != null) {
    $text = $text + " every " + $every
  }
  if ($time != null) {
    $text = $text + " from " + ($time | split row "-" | str join " to ")
  }
  if ($location != null) {
    $text = $text + " in " + $location
  }
  if ($starting != null) {
    $text = $text + " starting " + $starting
  }
  if ($until != null) {
    $text = $text + " until " + $until
  }
  print $"text is ($text)"
  let v =  $'tell application "Fantastical"
  parse sentence "($text)"
end tell'
  echo $v | osascript

}

