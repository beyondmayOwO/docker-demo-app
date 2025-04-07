# demo app

## Jenkins (CI/CD)
<details>
 <summary>GUI Based</summary>
 <br>
 <a href="https://youtu.be/pMO26j2OUME?si=esENpKJteUtMDoHS">-- Set Up ---</a>
 <br>
   
 | | Command | Description |
 | --------------- | --------------- | --------------- |
 | 1 | `docker run -p 8080:8080 -p 50000:50000 [master/slave communication] -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts` | Run the jenkins container |
 | 2 | `docker logs` | See the admin password generated |
 | 3 | `localhost:8080` | Create an admin account |

 <a href="https://youtu.be/tuxO7ZXplRE?si=Xflhhb4-xfHwvMc5">--- Create Multibranch Pipeline ---</a>
 
 | | Command | Description |
 | --------------- | --------------- | --------------- |
 | 1 | | Click 'new item'/'create new job' |
 | 2 | | Add the name, choose 'multibranch pipeline' and save |
 | 3 | | In 'Branch sources', choose 'git'. |
 | 4 | | Clone the project repo using https and paste it in 'project repository' |
 | 5 | | Behaviours > Discover branches > add > Filter by name (with regular expression) to choose which branches to track |
 | 6 | `.*` <br> `^dev\|master\|feature.*$` | Track all branches <br> Track only the branches selected |
 | 7 | | Create credentials for the pipeline created |
 | 8 | | Add the credentials in the configuration |
 | 9 | | save and it will scan right away for the branches|

 <a href="https://youtu.be/MY1w7sWW5ms?si=J7D8YJ12CX605HXG">--- Jenkinsfile - Jenkins Pipeline ---</a>

 | | Command | Description |
 | --------------- | --------------- | --------------- |
 | 1 | | Create Jenkinsfile in branch and scan |
 | 2 | `my-pipeline > branches > dev > stages` | Check out the stages and their status |
 | 3 | `my-pipeline > dev > #1 > Replay` | Replay a pipeline (easy way instead of modifying Jenkinsfile, checkout and commit all over again) |
 | 4 | `my-pipeline > dev > #1 > Restart from stage` | Restart from specific stage (build, test, deploy, etc) |

 --- Trigger Jenkins with Github (<a href="https://youtu.be/CmwTPxdx24Y?si=vjGLuEdH4Izi-eEY">Nana</a> | <a href="https://youtu.be/Z3S2gMBUkBo?si=giDXFEP3EOs2t6_h">Simply Explained</a>)---

 | | Command | Description |
 | --------------- | --------------- | --------------- |
 | 1 | 1. Install Github plugin in Jenkins <br> `Jenkins > Manage Jenkins > Plugins > Avaialble Plugins > Search 'Github Integration' > Install > Reload` <br><br> 2. In Github <br> `Go to Repo > Settings > Webhooks > Add Webhook > "jenkins-server-url/github-webhook" for payload url` <br><br> 3. See Jenkins webhook url <br> `Jenkins > Manage Jenkins > System > Github > Advanced > Tick override hook url` | Pushing notifications |
 | 2 | `my-pipeline > Configure > Build Configuration > Scan Multibranch Pipeline Triggers > Tick "Periodically if not otherwise run" > Set interval > Save` | Pulling |

 --- <a href="https://youtu.be/L9Ite-1pEU8?si=u2BpsAIxixzcyzeK">Configure Build Tools</a> ---

 | | Command | Description |
 | --------------- | --------------- | --------------- |
 | 1 | Configure gradle <br> `Manage Jenkins > Tools > Gradle installations > Add gradle > Add "name-version" for name > Choose version > Save` | For build tools already available |
 | 2 | 1. Install 'nodejs' plugin <br><br> 2. Configure Nodejs <br> `Manage Jenkins > Tools > Nodejs installations > Add nodejs > Add "name-version" for name > Choose version > "yarn@version" in  Global npm packages to install > Save` | For build tools not already available (Install plugins then configure) |
 | 3 | <a href="https://github.com/beyondmayOwO/docker-demo-app/blob/main/Jenkinsfile">Jenkinsfile</a> | Create Jenkinsfile in 'main' branch |
 | 4 | | Create new pipeline in Jenkins. Add 'main' to branch |
 | 5 | | Scan |
</details>
