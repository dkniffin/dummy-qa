#!/usr/bin/env bash

REPO_URL_PREFIX="http://github.com/"
REPO_URL_SUFFIX=".git"

BACKEND_REPO_SLUG="smashingboxes/FILLTHISIN" # TODO: Fill this in
FRONTEND_REPO_SLUG="smashingboxes/FILLTHISIN" # TODO: Fill this in
QA_REPO_SLUG="smashingboxes/FILLTHISIN" # TODO: Fill this in

BACKEND_REPO_URL=$REPO_URL_PREFIX$BACKEND_REPO_SLUG$REPO_URL_SUFFIX
FRONTEND_REPO_URL=$REPO_URL_PREFIX$FRONTEND_REPO_SLUG$REPO_URL_SUFFIXB
QA_REPO_URL=$REPO_URL_PREFIX$QA_REPO_SLUG$REPO_URL_SUFFIX

###########################################################
# Backend
cd ..
if [ $TRAVIS_REPO_SLUG != $BACKEND_REPO_SLUG ]; then
  cd $TRAVIS_BUILD_DIR
else
  git clone $BACKEND_REPO_URL ~/backend
  cd ~/backend
fi
bundle install
# TODO: Add any other backend instructions here
rails s &

###########################################################
# Frontend
if [ $TRAVIS_REPO_SLUG != $FRONTEND_REPO_SLUG ]; then
  cd $TRAVIS_BUILD_DIR
else
  git clone $FRONTEND_REPO_URL ~/frontend
  cd ~/frontend
fi
npm install
# TODO: Add any other frontend instructions here
npm start &

###########################################################
# QA
cd ..
if [ $TRAVIS_REPO_SLUG == $QA_REPO_SLUG ]; then
  export QA_PATH=$TRAVIS_BUILD_DIR
  cd $TRAVIS_BUILD_DIR
else
  export QA_PATH="~/qa"
  git clone $QA_REPO_URL ~/qa
  cd ~/qa
fi
bundle install
export DISPLAY=:99.0
sh -e /etc/init.d/xvfb start
sleep 3 # give xvfb some time to start

cd $TRAVIS_BUILD_DIR
