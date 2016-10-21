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

# Travis sets this, and it messes with bundler. We'll just unset it
unset BUNDLE_GEMFILE

###########################################################
# Backend

if [[ $TRAVIS_REPO_SLUG == $BACKEND_REPO_SLUG ]]; then
  cd $TRAVIS_BUILD_DIR
else
  git clone $BACKEND_REPO_URL ~/backend
  cd ~/backend
fi
bundle install
cp config/secrets.example.yml config/secrets.yml
cp config/database.example.yml config/database.yml
psql -c 'create database dummy_backend_test;' -U postgres
bundle exec rake db:migrate --trace
bundle exec rake test:prepare --trace
bundle exec bin/rails s > /dev/null 2>&1 &

###########################################################
# Frontend

# TEMPLATE_TODO: Pair with a frontender to create a basic hello world app to test this.
if [[ $TRAVIS_REPO_SLUG == $FRONTEND_REPO_SLUG ]]; then
  cd $TRAVIS_BUILD_DIR
else
  echo "Cloning frontend repo ($FRONTEND_REPO_URL)..."
  git clone $FRONTEND_REPO_URL ~/frontend
  cd ~/frontend
fi
echo 'Setting up frontend app...'
# TODO: Add any other frontend instructions here
npm install
npm start &
echo 'Done setting up frontend app.'

###########################################################
# QA

if [[ $TRAVIS_REPO_SLUG == $QA_REPO_SLUG ]]; then
  export QA_PATH=$TRAVIS_BUILD_DIR
  cd $TRAVIS_BUILD_DIR
else
  export QA_PATH="~/qa"
  git clone $QA_REPO_URL ~/qa
  cd ~/qa
fi
bundle install
# export DISPLAY=:99.0
# sh -e /etc/init.d/xvfb start
# sleep 3 # give xvfb some time to start

cd $TRAVIS_BUILD_DIR
