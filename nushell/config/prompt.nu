#!/usr/bin/env nu

source ~/.config/nushell/config/starship_init.nu

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r' | ansi gradient --fgstart 0xffffff --fgend 0xffffff --bgstart 0x4673b3 --bgend 0xb84467)
    ] | str collect)

    $time_segment
}

# Use nushell functions to define your right and left prompt
# $env.PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = "〉"
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

