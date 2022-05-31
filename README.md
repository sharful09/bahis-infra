# bahis-infra
infrastrucutre repository

Install docker:

https://docs.docker.com/engine/install/ubuntu/

```
sudo apt-get update

 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

```
and docker-compose
```
sudo apt-get install docker-compose
```

## Run
First you need to clone bahis-serve in the same directory as this repository.
`cd .. && git clone https://github.com/road86/bahis-serve`
in the background or tmux
```
cd bahis-infra/deployment/
sudo docker-compose build
sudo docker-compose up & 
```
To initialise database for the first time: 
```
psql -U postgres -h localhost -p 99 < pgdb/init.sql
psql -U postgres -h -d coredb localhost -p 99 < pgdb/bahis_minimal.sql
```
you need to download bahis minimal separately
