function moon
    weather Moon
end

function weather
    curl "http://wttr.in/$argv"
end

set -x PYTHONBREAKPOINT ipdb.set_trace
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden'

alias nvim=~/code/nvim.appimage

fish_vi_key_bindings
