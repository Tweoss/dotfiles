#!/usr/bin/env nu

export def e [expr: string] {
    numbat -e $expr | str trim | pbcopy
    pbpaste
}
