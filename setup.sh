#!/bin/bash

source env.sh

mkdir -p $DOLET_DIR $DOLET_DIR/js $DOLET_DIR/node_modules

# add env variable to bash profile
cat env.sh > $DOTLET_PROFILE_FILE
cat bash.sh >> $DOTLET_PROFILE_FILE

# copy alias
cp alias.sh $DOLET_ALIAS_FILE
cp functions.sh $DOLET_FUNCTION_FILE

# copy js file
cp js/* $DOLET_JS_DIR
cp -rf node_modules/* $DOLET_NODE_MODULES

# setup git
cat .gitconfig > $HOME/.gitconfig

grep $DOTLET_PROFILE_FILE $BASH_PROFILE_FILE -q || $(echo "source $DOTLET_PROFILE_FILE" >> $BASH_PROFILE_FILE)

source $BASH_PROFILE_FILE
