function get_current_branch() {
  git branch | grep \* | cut -d ' ' -f2
}

BRANCH_TO_DELETE=$(get_current_branch)
git checkout master && git pull origin master && git branch -D "$BRANCH_TO_DELETE"
