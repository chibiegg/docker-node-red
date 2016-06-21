#!/bin/bash
if [ -z "${ADMIN_USERNAME}" ]; then
  ADMIN_USERNAME="node"
fi

if [ -z "${ADMIN_PASSWORD}" ]; then
  # r3d
  ADMIN_PASSWORD='$2a$08$sJopYsAKQVhotbkRtdjhnuot4DBcGhP6PVSZ39OfdBfgEkxD5WAEK'
fi

SETTINGS=`cat settings.js.template`
SETTINGS="${SETTINGS//%%admin_username%%/${ADMIN_USERNAME}}"
SETTINGS="${SETTINGS//%%admin_password%%/${ADMIN_PASSWORD}}"

echo "${SETTINGS}" > settings.js
node red.js
