if [ "$GIT_USER_EMAIL" != "" ]
then
    git config --global user.email $GIT_USER_EMAIL
else
    echo "GIT_USER_EMAIL is not set, skipping setting git user email"
fi

if [ "$GIT_USER_NAME" != "" ]
then
    git config --global user.name "$GIT_USER_NAME"
    # Extract lowercase initials from GIT_USER_NAME
    INITIALS=$(echo "$GIT_USER_NAME" | awk '{for(i=1;i<=NF;i++) printf "%s", substr(tolower($i),1,1)}')
    git config --global alias.nb "!git checkout -b ${INITIALS}/\$1 #"
else
    echo "GIT_USER_NAME is not set, skipping setting git user name"
fi

git config --global core.editor vim
git config --global pull.ff only
git config --global alias.cm checkout main
git config --global alias.cp cherry-pick
git config --global init.defaultbranch main