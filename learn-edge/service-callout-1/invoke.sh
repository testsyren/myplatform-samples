#!/bin/bash

## Ask the user for input.

source ../scripts/verify_provisioning.sh
source ../../setup/userconf.sh || exit 1
get_password || exit 1



## Use the Edge Management API to get the API key.

printf "\nGet API key (the Consumer Key) from the Learn Edge App. Press Return to continue: \n"
read

key=`curl -u $username:$password $url/v1/o/$org/developers/learn-edge-developer@example.com/apps/learn-edge-app 2>/dev/null \
     | grep consumerKey | awk -F '\"' '{ print $4 }'`


printf "\nThe API key (Consumer Key) for the Learn Edge App is $key\n"


## Call the API JSON response

printf "\nCall the API and notice that the custom headers are returned. Press Return to contine:\n"
read

printf "\ncurl -i http://$org-$env.$api_domain/v1/learn-edge/json?apikey=$key\n\nResponse:\n"

curl -i "http://$org-$env.$api_domain/v1/learn-edge/json?apikey=$key"
printf "\n"


