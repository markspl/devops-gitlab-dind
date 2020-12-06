### Install
- Clone repository
- `docker-compose up -d`
- Wait `gitlabweb` container fully booting up.
 - Reload `http://localhost:8080` until it asks you to..
 - Change password. Change password to which you easily remember, for example `1234567890`. These login information will be used when pushing the project on local Gitlab web server.
- Upload repository with command `./create-gitlab-project.sh`. This uploads the project on local Gitlab server.

>**NOTE (Windows):**
> If you get an error code:
>
>`fatal: Authentication failed for 'http://localhost:8080/root/project.git/'`
>
> Your computer may try push repository with wrong credentials, which are stored in the system. This can be done with CMD (Administrator) command which removes GIT credential manager for Windows with `git config --system --unset credential.helper` or from `Control Panel > Credentials Manager` where the GIT account should be deleted.

- Go to website `http://localhost:8080/root/project/-/settings/ci_cd` and copy `registration token` from under topic **Runners**.  

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

### Solved issues
- Credentials problem on Windows and GIT
- GitLab's projects *Jobs*
 - `ERROR: Failed to remove network for build`
 - `ERROR: Job failed: invalid volume specification`
 - -> Solved with removing `docker volumes` from file `gitlab-runner-register.sh` but
   - `ERROR: error during connect: Get http://docker:2375/v1.40/info: dial tcp: lookup docker on 127.0.0.11:53: no such host`
 - write about exec and the files `runner-registration.sh` and `gitlab-runner-register.sh`
   - Line-endings
   - Solve with mounting a single file.
   - https://stackoverflow.com/questions/36765138/
 - Docker-in-docker detects containers which are stored on host pc. Need to rename containers which are tested in gitlab-ci, or delete original containers from the host pc.
 - Even forcing docker-compose to recreate with flag "--force-recreate", it did not recreate containers and used old code. One day fightning with the Docker why I couldn't connect to HTTPSERV and the reason was that.
