#!/bin/sh
# Get the registration token from (Under topic "Runners"):
# http://localhost:8080/root/project/-/settings/ci_cd

registration_token="XXXXXXXXXXXXXXXXXXXXXXXXXX"

# DON'T RUN THIS ON WINDOWS
# Issue with "docker exec" (WINDOWS)
#
# On windows it uses windows path on "docker-volumes"
# Because of this the container doesn't find
# "C://.." address.
#
# "docker run" has a flag -v which tells the mount path locates in the
# container, but the "docker exec" does not have the same flag.
#
# That's why the another solution to replace "exec" was created.
# Does the same but with more complicated steps.
#

docker exec -it gitlab-runner1 \
  gitlab-runner register \
    --non-interactive \
    --registration-token ${registration_token} \
    --locked=false \
    --description docker-stable \
    --url http://gitlab-web \
    --executor docker \
    --docker-image docker:stable \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
    --docker-network-mode gitlab-network
