set -x

BEFORE_PATH=$(pwd)
cd $QA_PATH

xvfb-run bundle exec cucumber
EXIT_CODE=$?

cd $BEFORE_PATH
exit $EXIT_CODE
