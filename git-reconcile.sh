function get_branch() {
  git branch | grep \* | cut -d ' ' -f2
}

ORIGINAL_BRANCH=$(get_branch)

echo $ORIGINAL_BRANCH
git stash save
git checkout master
git pull origin master
git checkout ${ORIGINAL_BRANCH}
git rebase master
git stash pop
