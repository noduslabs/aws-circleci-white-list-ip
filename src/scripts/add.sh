# shellcheck source=./common.sh
source "$(pwd)/src/scripts/common.sh"

Add() {
  Common

  echo ""
  echo ""
  echo "PARAM_GROUPID = << parameters.group-id >>"
  echo "PARAM_GROUPID = ${PARAM_GROUPID}"
  echo "Allowing CircleCI to access port ${PARAM_PORT} from IP ${IP} to the security group ${PARAM_GROUPID}"

  ${AWS_COMMAND} ec2 authorize-security-group-ingress --group-id "${PARAM_GROUPID}" --ip-permissions 
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
  Add
fi
