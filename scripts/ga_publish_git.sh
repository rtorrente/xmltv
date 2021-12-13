#!/usr/bin/env bash

now=$(date +"%d/%m/%Y %H:%M:%S-%Z")

force_push () {
    git config --global user.name 'GithubAction'
    git config --global user.email 'GithubAction@users.noreply.github.com'
    git add --all
    LAST_COMMIT_MESSAGE=$(git log -1 --pretty=%B)
    NEW_COMMIT_MESSAGE="[ACTION]update TV guides ($now)"
    if [[ $LAST_COMMIT_MESSAGE =~ ^"[ACTION]".* ]] ;
    then
      echo -e "\n- Last COMMIT is auto commit, we amend the commit\n"
      git commit --amend -m "$NEW_COMMIT_MESSAGE"
    else
      echo -e "\n- Last COMMIT is other commit, we create a new commit\n"
      git commit -m "$NEW_COMMIT_MESSAGE"
    fi
    git push -f origin
}

echo -e "\n- Force push changes\n"
force_push

echo -e "\n- Changes have been pushed --> exit\n"
exit 0