#!/usr/bin/env bash

set -x

REPO_URL_PREFIX="http://github.com/"
REPO_URL_SUFFIX=".git"

BACKEND_REPO_SLUG="dkniffin/dummy-backend"
FRONTEND_REPO_SLUG="dkniffin/dummy-frontend"
QA_REPO_SLUG="dkniffin/dummy-qa"

BACKEND_REPO_URL=$REPO_URL_PREFIX$BACKEND_REPO_SLUG$REPO_URL_SUFFIX
FRONTEND_REPO_URL=$REPO_URL_PREFIX$FRONTEND_REPO_SLUG$REPO_URL_SUFFIXB
QA_REPO_URL=$REPO_URL_PREFIX$QA_REPO_SLUG$REPO_URL_SUFFIX

docker network create dummy-network

WAITFORIT=/tmp/waitforit.sh
wget https://github.com/maxcnunes/waitforit/releases/download/v1.4.0/waitforit-linux_amd64 -O $WAITFORIT
chmod a+x $WAITFORIT

###########################################################
# Backend

if [[ $TRAVIS_REPO_SLUG == $BACKEND_REPO_SLUG ]]; then
  export BE_PATH=$TRAVIS_BUILD_DIR
  cd $TRAVIS_BUILD_DIR
else
  export BE_PATH="$HOME/backend"
  git clone $BACKEND_REPO_URL $BE_PATH
  cd $BE_PATH
fi

docker-compose up -d
$WAITFORIT -full-connection=http://localhost:3000
curl http://localhost:3000

###########################################################
# Frontend

if [[ $TRAVIS_REPO_SLUG == $FRONTEND_REPO_SLUG ]]; then
  export FE_PATH=$TRAVIS_BUILD_DIR
  cd $TRAVIS_BUILD_DIR
else
  export FE_PATH="$HOME/frontend"
  git clone $FRONTEND_REPO_URL $FE_PATH
  cd $FE_PATH
fi

docker-compose up -d
$WAITFORIT -full-connection=http://localhost:8080

###########################################################
# QA

if [[ $TRAVIS_REPO_SLUG == $QA_REPO_SLUG ]]; then
  export QA_PATH=$TRAVIS_BUILD_DIR
  cd $TRAVIS_BUILD_DIR
else
  export QA_PATH="$HOME/qa"
  git clone $QA_REPO_URL $QA_PATH
  cd $QA_PATH
fi

docker-compose up -d

cd $TRAVIS_BUILD_DIR
