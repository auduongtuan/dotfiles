/opt/homebrew/bin/brew shellenv | source

# NVM configuration
set -gx NVM_DIR "$HOME/.nvm"

# PNPM configuration
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q "*$PNPM_HOME*" "$PATH"
    set -gx PATH "$PNPM_HOME" $PATH
end

# Windsurf PATH
set -gx PATH "$HOME/.codeium/windsurf/bin" $PATH

set -gx PATH "$NVM_DIR/versions/node/$nvm_current_version/bin" $PATH

# Python PATH
set -gx PATH $PATH "$HOME/Library/Python/3.9/bin"

# Bun configuration
# add to ~/.config/fish/config.fish
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Claude alias
alias claude="$HOME/.claude/local/claude"

alias cl="claude"
alias gm="gemini"

# FNM (Fast Node Manager)
set FNM_PATH "$HOME/Library/Application Support/fnm"
if test -d "$FNM_PATH"
    set -gx PATH "$HOME/Library/Application Support/fnm" $PATH
    fnm env --use-on-cd | source
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    set -l cow_characters alpaca bunny kitty koala llama hellokitty fox sheep turtle tux default dragon-and-cow elephant dragon blowfish moose stegosaurus vader-koala meow ghostbusters cupcake
    set -l random_character (random choice $cow_characters)
    fortune -s | cowsay -f $random_character | lolcat
end

starship init fish | source
zoxide init fish | source
fzf --fish | source

string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)

# Git aliases
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push origin HEAD'
alias gpl='git pull'
alias gco='git checkout'
alias gbr='git branch'

# Git workflow functions
function gacp
    if test (count $argv) -eq 0
        echo "Usage: gacp 'commit message'"
        return 1
    end
    git add . && git commit -m "$argv[1]" && git push origin HEAD
end

function qc
    if test (count $argv) -eq 0
        git add . && git commit -m "feat: update $(date '+%Y-%m-%d %H:%M')" && git push origin HEAD
    else
        git add . && git commit -m "$argv[1]" && git push origin HEAD
    end
end
