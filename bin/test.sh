set -x

APP_ENV=DEV xvfb-run bundle exec cucumber
