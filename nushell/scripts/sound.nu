#!/usr/bin/env nu

export def s [] {
    let code = $env.LAST_EXIT_CODE;
    if $code == 0 {
        osascript -e $'display notification "succeeded" with title "Command in nushell" sound name "Glass"'
    } else {
        osascript -e $'display notification "failed" with title "Command in nushell" sound name "Purr"'
    }
    nu -c $"exit ($code)"
}
