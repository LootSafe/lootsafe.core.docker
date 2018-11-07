# LootSafe Core Docker Deployment
This will guide you through running an instance (test or otherwise) of the lootsafe api backend.

### Requirements -- **These are must haves**
1. Preferrably a Debian based system *(Ubuntu FTW)*
2. Docker Installed and ready to go *(If you are using Windows you mgiht have to do some fandangling to get your WSL / otherwise points in order)*
3. Docker-Compose Installed - *This Does all the magic*
4. A stressball incase docker gives you issues on your system

### Let Us Begin

##### Installation

Let's start by making a new directory where we'll keep our instance data.
```bash
mkdir instance_01
cd instance_01
```
Now you can choose to clone this repo (Hope your ssh keys are installed) or copy pasta the file contents.Only  2 scripts in here.

```bash
git clone git@github.com:LootSafe/lootsafe.core.docker.git
```

move the *docker-compose.yml* and *install.sh* file to the root of your `instance_01` folder.

You may have to give permission to execute the script. While in the instance folder run:
```bash
chmod +x ./install.sh
```
...and then  run the file `./install.sh`

Depending on your settings you may be prompted to put in your ssh key pass a couple times, in order to access the private repo.
##### Config
You will have to modify two files if they are not correct already.
in the `lootsafe.core` directory you will modify `config.js` and update the three values as follows.
```yml
#Any port above 1024 will do.
port: 1337
provider: 'ganache:8545'
dbURI: 'mongodb://mongo27017'
```

Now you will have to modify `lootsafe.core/api/contracts/core/` and change *host* from `"localhost"` to `"ganache"`.

##### Start her up
Go back into the instance root folder and run the following command.
```bash
docker-compose up -d
```
***Done!***
Give it a good 30 seconds to start up.

## Having trouble?
- You can check the status of running docker containers by running `docker ps ` or `docker ps -a` for all containers regardless of status.
- If one of your containers closed up, you can try starting it up with the follwing command to see what's going on in there.
  ```
  docker start -i -a [container name here]
  ```
  You can wait around until the error appears. If all is well and you want to leave run `ctrl+p+q`.
  
  
