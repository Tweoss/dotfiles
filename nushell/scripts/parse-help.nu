#!/usr/bin/env nu

# takes command name and command argument to create help, parses, creates table of parsed commands, and appends to generated_completions.nu
export def save-completion [command-name: string, command-switch: string = "--help"] {
    ((nu -c $"($command-name) ($command-switch)" | parse-help | make-completion $"($command-name)") + "\n") | save $"($env.HOME)/.config/nushell/config/generated_completions/($command-name).nu";
    $"source \"~/.config/nushell/config/generated_completions/($command-name).nu\";\n" | save --append "~/.config/nushell/config/generated_completions.nu"
    $"source \"~/.config/nushell/config/generated_completions/($command-name).nu\";"
}

# parses a input string in --help format and returns a table of parsed flags
def parse-help [] {
    # help format  '        -s,                      --long                   <format>                 description   '
    $in | parse -r '\s\s+(?:-(?P<short>\w)[,\s]+)?(?:--(?P<long>[\w-]+))\s*(?:<(?P<format>.*)>)?\s*(?P<description>.*)?'
}

# takes a table of parsed help commands in format [short? long format? description]
def make-completion [command-name: string] {
    build-string "extern \"" $command-name "\" [\n" ($in | each { |it|
        build-string "\t--" $it.long (
            if ($it.short | empty?) == false {
                build-string "(-" $it.short ")" 
            }
        ) (
            if ($it.description | empty?) == false {
                build-string "\t\t# " $it.description
            }
        )
    } | str collect "\n") "\n\t...args\n]\n"
}
