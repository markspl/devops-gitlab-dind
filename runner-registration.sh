# Get the registration token from (Under topic "Runners"):
# http://localhost:8080/root/project/-/settings/ci_cd
registration_token="AWs7zvjfLxcCc9sFPp9W"
gitlab-runner register --non-interactive --registration-token ${registration_token} --locked=false --description docker-stable --url http://gitlab-web --executor docker --docker-image docker:stable --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" --docker-network-mode gitlab-network