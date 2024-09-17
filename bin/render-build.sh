#!/usr/bin/env bash
# exit on error
echo "render-build.sh is running"

set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate