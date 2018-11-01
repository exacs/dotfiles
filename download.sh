#!/bin/sh
#
# Run this script directly from REMOTE piping it to a sh
# - This will clone the repository and start the "bootstrap.sh"
#
read -p "This will install the '.dotfiles' repo in '$HOME/dotfiles'. Are you sure? [Yn] " -r

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Cancelling..."
    exit
fi

REPO_DIR=$HOME/dotfiles

# Clone the repo
git clone git@github.com:exacs/dotfiles.git $REPO_DIR

# Execute the script
$REPO_DIR/bootstrap.sh
