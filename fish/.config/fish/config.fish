function moon
  weather Moon
end

function weather
  curl "http://wttr.in/$argv";
end

function backup
    cp $1 $1.backup
end

alias dc="docker-compose"
set PATH /home/jon/.local/bin /home/jon/.cargo/bin $PATH
set -x GOPATH /home/jon/code/golang
alias python3 python3.8

# set -x DOTNET_ROOT $HOME/dotnet
# set PATH $HOME/dotnet $PATH
set DOTNET_CLI_TELEMETRY_OPTOUT 1

alias kubectl="microk8s kubectl"
alias vimrc="vim ~/dotfiles/vim/.vimrc"

set -gx FZF_DEFAULT_COMMAND  'rg --files --hidden'
