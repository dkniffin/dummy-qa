set -x

BEFORE_PATH=$(pwd)
cd $QA_PATH
APP_ENV=DEV xvfb-run bundle exec cucumber
cd $BEFORE_PATH
