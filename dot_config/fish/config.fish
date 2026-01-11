# Fish Configuration

# Golang
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
fish_add_path $GOBIN

# Homebrew (Apple Silicon)
if test -d /opt/homebrew
    fish_add_path /opt/homebrew/bin
end

# 1Password SSH Agent (for Git signing)
# https://developer.1password.com/docs/ssh/
if test -S "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
end

# Editor
set -gx EDITOR vim

# Aliases
alias ll="ls -la"
alias g="git"
alias gs="git status"
alias gd="git diff"
alias gc="git commit"
alias gp="git push"

# Local config (not tracked in git)
if test -f ~/.config/fish/config.local.fish
    source ~/.config/fish/config.local.fish
end
