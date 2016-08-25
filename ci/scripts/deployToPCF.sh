#!/bin/sh 
. $APPNAME/ci/scripts/common.sh

main()
{
  cf_login
  summaryOfApps
  VERSION=`cat resource-version/number`
  echo $VERSION

  cd $APPNAME
  ## Variables used during Jenkins Build Process
  APPNAME=$APPNAME-$VERSION

  echo_msg "Pushing new Microservice"
  cf push $APPNAME 

  summaryOfApps
  cf logout
}

trap 'abort $LINENO' 0
SECONDS=0
SCRIPTNAME=`basename "$0"`
main
printf "\nExecuted $SCRIPTNAME in $SECONDS seconds.\n"
trap : 0
