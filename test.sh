#!/bin/bash
export HEROKU_API_KEY="6ec683b9-7c69-46ef-b65a-c709bc720d6d"
BRANCH_LOWERCASE="$( echo "$CI_BRANCH" | tr '[:upper:]' '[:lower:]' )"
BRANCH_LOWERCASE=${BRANCH_LOWERCASE#'test/'}
APP_NAME="sol-test-${BRANCH_LOWERCASE}"
APP_URL="http://${APP_NAME}.herokuapp.com"

# Check if the application doesn't exist and create the application on heroku
APPS="$(heroku apps | grep ${APP_NAME})"
if [ -z ${APPS} ]; 
then  
	heroku apps:create ${APP_NAME} --region eu
	
	# Set environment variables on heroku
	heroku config:set PORT=80
	DEBUG="*" --app ${APP_NAME}
	
	# Add collaborators on heroku
	heroku sharing:add Dmitry.Kuznetsov@returnonintelligence.com  --app ${APP_NAME}
fi
echo 'OK!'
git push --force "https://${HEROKU_API_KEY}:${HEROKU_API_KEY}@git.heroku.com/${APP_NAME}.git" ${BRANCH_NAME}:master