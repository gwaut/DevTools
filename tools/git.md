# Git prompt (https://github.com/magicmonty/bash-git-prompt):

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

Add to the ~/.bashrc
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi


## Config
git config --global alias.lg "log --oneline --all --graph --decorate"
git config --global alias.s "status -s"
