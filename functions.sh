aa() {
  echo -e "alias ${1}='${2}'" >> ~/.bash_alias && load 
}

ad() {
  sed '/alias ${1}=/d' -i ~/.bash_alias
}

au() {
  ad ${1} && aa ${1} ${2} && load
}

deploy() {
  message="Deploy branch ${1}? (y/N): "
  read -p "$message" -r
  if [[ $REPLY == y ]]
  then
    echo
    git checkout master && git pull && git merge --no-ff ${1} && make && make test && git push origin HEAD && echo "Check y/yenkins for build status."
  fi
}

gpop() {
  git stash pop "stash@{${1}}}"
}

gdrop() {
  git stash drop "stash@{${1}}}"
}

galias() {
  git config --global alias.${1} "${@:2}"
}

dalias() {
  git config --global --unset  alias.${1}
}

cd() {
  builtin cd  ${1} && pwd >> ~/.cd_history && echo "$(tail -20 ~/.cd_history)" > ~/.cd_history
}

fd() {
  git diff ${1} ${2} --name-status | awk "{print \"$Red\" \$1 \"\t\" \"$Cyan\" \$2 \"$Colour_Off\"}"
}

findGit() {
  find ${1} -type d -exec test -e '{}/.git' ';' -print -prune
}

notebook() {
  jupyter notebook --no-browser --port=${1} --ip=0.0.0.0 --no-browser --config=~/pg/txn-growth-data-science/ipython_notebook_config.py
}

ji() {
  open https://jira.yelpcorp.com/browse/${1}
}

board() {
  open https://reviewboard.yelpcorp.com/r/${1}
}