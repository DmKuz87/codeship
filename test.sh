#!/bin/bash
export HEROKU_API_KEY="6ec683b9-7c69-46ef-b65a-c709bc720d6d"
BRANCH_LOWERCASE="$( echo "$CI_BRANCH" | tr '[:upper:]' '[:lower:]' )"
BRANCH_LOWERCASE_SHORT=${BRANCH_LOWERCASE#'test/'}
APP_NAME="sol-test-${BRANCH_LOWERCASE_SHORT}"
APP_URL="http://${APP_NAME}.herokuapp.com"

# Check if the application doesn't exist and create the application on heroku
APPS="$(heroku apps | grep ${APP_NAME})"

git config --global http.postBuffer 524288000
git push --force "https://${HEROKU_API_KEY}:${HEROKU_API_KEY}@git.heroku.com/${APP_NAME}.git" ${CI_BRANCH}:master