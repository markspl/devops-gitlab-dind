### Install
- Clone repository
- `docker-compose up -d`
- Wait `gitlabweb` container fully booting up.
 - Reload `http://localhost:8080` until it asks you to..
 - Change password. Change password to which you easily remember, for example `1234567890`. These login information will be used when pushing the project on local Gitlab web server. Username is `root`.
- Upload repository with command `./create-gitlab-project.sh`. This uploads the project on local Gitlab server.

>**NOTE (Windows):**
> If you get an error code:
>
>`fatal: Authentication failed for 'http://localhost:8080/root/project.git/'`
>
> Your computer may try push repository with wrong credentials, which are stored in the system. This can be done with CMD (Administrator) command which removes GIT credential manager for Windows with `git config --system --unset credential.helper` or from `Control Panel > Credentials Manager` where the GIT account should be deleted.

- Go to website http://localhost:8080/root/project/-/settings/ci_cd and copy `registration token` from under topic **Runners**.  

> **<ins>If you have a Windows PC</ins>:** *(Sorry, I couldn't find better way to solve this. More about this later)*
>
> **>** You'll work with the file `runner-registration.sh`
>
> On Windows machines it's more complicated to register a Gitlab runner.
>
> - Duplicate `template-runner-registration.sh` and rename it as `runner-registration.sh`
> - Replace `XXX` in the file `runner-registration.sh` with copied `registration token`
> - Connect to container with command `docker exec -it gitlab-runner1 bash`
> - Register runner with running a file `./runner-registration.sh`
> - Now you can exit the bash with `exit`

> **<ins>If you have Linux:</ins>** *(Not tested because I don't have a Linux system, but it <ins>should</ins> work. If not, follow steps wrote above for Windows)*
>
> **>** You'll work with the file `gitlab-runner-register.sh`
>
> - Duplicate `template-gitlab-runner-register.sh` and rename it as `gitlab-runner-register.sh`
> - Replace `XXX` in the file `gitlab-runner-register.sh` with copied `registration token`
> - Run command `./gitlab-runner-register.sh` to register the Gitlab runner.

**Installation completed!** Now the Gitlab web and runner are .. running. After this Gitlab will build the project at the first time.

Here you can see all project's Jobs: http://localhost:8080/root/project/-/jobs

### Possible errors

#### Gitlab CI: "Starting service docker:dind. not found (docker.go:460:0s)"

This happens on Windows OS.

Check `gitlab-runner1-config/config.toml` file. It may have `\r` or other extra strings in names. Removing these the error should be gone.