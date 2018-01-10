source env.sh

mkdir -p $DOLET_DIR $DOLET_DIR/js $DOLET_DIR/node_modules

# add env variable to bash profile
cat env.sh > $BASH_PROFILE_FILE
cat bash.txt >> $BASH_PROFILE_FILE

# copy alias
cp alias.txt $DOLET_ALIAS_FILE
cp functions.txt $DOLET_FUNCTION_FILE

# copy js file
cp -rf js/* $DOLET_JS_DIR
cp -rf node_modules/* $DOLET_NODE_MODULES

# setup git
cat .gitconfig > $HOME/.gitconfig

source $BASH_PROFILE_FILE

