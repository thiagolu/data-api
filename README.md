Api to merge data from a csv file, contaning information about a Company profile. The data templates used for development can be found on the `data_templates/` folder

**API routes**
```ruby
  post '/import', to: 'application#import'
  put '/integrate_data', to: 'application#integrate_data'

```

**Request body**
```ruby
{
  file: File
}
```

**Web urls**
To import data into the database: http://localhost:3000/

And http://localhost:3000/integrate.html to add website information

For convinience docker was used on this project, so in case you don't have it installed this is a quick setup copied from the official website:

## Project setup with docker

**To install docker:**

```bash
$ sudo apt-get remove docker docker-engine docker.io containerd runc

$ sudo apt-get update

$ sudo apt-get install docker-ce

$ sudo docker container run hello-world
```

In case the installation fails, try adding docker via repositories through the tutorial:
https://docs.docker.com/install/linux/docker-ce/ubuntu/

**Install docker-compose**

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```

> Note: If the command docker-compose fails after installation, check your path. 
> You can also create a symbolic link to /usr/bin or any other directory in your path. Ex:. `sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose`

**Running application**

```
sudo docker-compose up
```

**Running custom commands inside container**

```
# access container bash
sudo docker-compose web bash

# npm install ex
sudo docker-compose web npm install
```

**Run docker without sudo permission**

You need to create a group named docker and add the current user to it

```
sudo groupadd docker

sudo usermod -aG docker $USER

# Reboot to changes be applied
sudo reboot
```
