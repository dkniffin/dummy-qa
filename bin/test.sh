set -x

BEFORE_PATH=$(pwd)
cd $QA_PATH

# docker-compose run qa bundle exec cucumber
docker-compose run qa curl http://localhost:8080
docker-compose run qa curl http://localhost:3000
EXIT_CODE=$?

cd $BEFORE_PATH
exit $EXIT_CODE
