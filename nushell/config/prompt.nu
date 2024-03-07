#!/usr/bin/env nu

source ~/.config/nushell/config/starship_init.nu

# Use nushell functions to define your right and left prompt
# $env.PROMPT_COMMAND_RIGHT = { create_right_prompt }
def create_right_prompt [] {
    let time_segment = ([
        (date now | format date '%m/%d/%Y %r')
    ] | str join)

    $time_segment
}
$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = "〉"
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

