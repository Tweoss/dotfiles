if status is-interactive
    # Make sure that the default keybindings are used not vim
    fish_default_key_bindings
    # Commands to run in interactive sessions can go here
end

# homebrow executable
set PATH "/opt/homebrew/bin/" $PATH

# random scripts
set PATH "/Users/francischua/gitutils/executables/shellscript" $PATH
set PATH "/usr/local/opt/ruby/bin" $PATH
set PATH "/Library/TeX/texbin" $PATH
set PATH "/usr/local/texlive/2020/bin/x86_64-darwin" $PATH
set PATH "/Users/francischua/gitutils/wabt/build" $PATH

# wine executable
set PATH "/Applications/Wine Crossover.app/Contents/Resources/wine/bin" $PATH
set -gx WINEPATH "/Users/francischua/Wine Files/drive_c/GTK/bin;/Users/francischua/Wine Files/drive_c/Program Files/Common Files/LPG Shared/libs"

# for messing around with airport
set PATH "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport" $PATH

# go configuration executables
set PATH "/Users/francischua/go/bin" $PATH
set -gx GOPATH "$HOME"
set -gx GOPRIVATE "github.com/onosproject/*"

# ONF stuff
# source ~/src/github.com/onosproject/build-tools/build/bash_aliases
set -gx ONOS_ROOT "/Users/francischua/gitprojects/onos"
set PATH "$ONOS_ROOT/tools/dev/bash_profile" $PATH
set -gx ONOS_REPOS "build-tools onos-api onos-cli onos-helm-charts onos-topo ran-simulator sdran-helm-charts"
set -gx RICVM "10.128.99.12"
set PATH "/Users/francischua/thomas_scripts" $PATH

# make sure the right prompt functions with the correct spacing
set -gx fish_emoji_width 2

# rust
export PATH="$HOME/.cargo/bin:$PATH" 

# lilypond executable
set PATH "/Applications/LilyPond.app/Contents/Resources/bin" $PATH

# image compressor
set PATH "/Users/francischua/Dropbox/My Mac (Francis-MBP.local)/Downloads/pngquant/" $PATH

# initialize starship
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /usr/local/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

