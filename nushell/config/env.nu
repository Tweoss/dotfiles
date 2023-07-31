#!/usr/bin/env nu

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
     # the default
     # ($nu.config-path | path dirname | path join 'scripts')
     # custom
     /Users/francischua/.config/nushell/scripts
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# CS 107E
$env.CS107E = "/Users/francischua/gitprojects/cs107e.github.io/cs107e"

# Wasmedge
$env.DYLD_LIBRARY_PATH = "/Users/francischua/.wasmedge/lib"
$env.LIBRARY_PATH = "/Users/francischua/.wasmedge/lib"
$env.C_INCLUDE_PATH = "/Users/francischua/.wasmedge/include"
$env.CPLUS_INCLUDE_PATH = "/Users/francischua/.wasmedge/include"

$env.EDITOR = "/Users/francischua/.cargo/bin/hx"


# Starship needs to be called apparently every startup
mkdir ~/.cache/starship
# starship did not update -c for nushell yet.
# starship init nu | save ~/.cache/starship/init.nu
