HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

setopt SHARE_HISTORY        # Share history across sessions
setopt HIST_IGNORE_SPACE    # commands starting w/ a space don't go into history

__git_branch() {
    git symbolic-ref HEAD 2> /dev/null | cut -d '/' -f 3
}

PS1="[%*] %m:%~ %n$ "

[ -z "$PS1" ] && return

for f in `ls ~/bin`; do
  if [ -d ~/bin/$f ]; then
    if [ -e ~/bin/$f/bin ]; then
      PATH="$PATH:~/bin/$f/bin"
    else
      PATH="$PATH:~/bin/$f"
    fi
  fi
done

export PATH

if [ -e $HOME/.dotfiles/.aliases ]; then
    source $HOME/.dotfiles/.aliases
fi
