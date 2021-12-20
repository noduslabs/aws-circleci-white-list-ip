source "./common.sh"

Del() {
  Common

  echo "Removing CircleCI access from IP ${IP} to the security group ${PARAM_GROUPID}"

  ${AWS_COMMAND} ec2 revoke-security-group-ingress --group-id "${PARAM_GROUPID}" --ip-permissions \
   
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
  Del
fi
