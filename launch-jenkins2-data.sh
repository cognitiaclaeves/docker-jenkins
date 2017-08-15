data_path="/data/jenkins2/jenkins_home"
log_path="/data/jenkins2/jenkins_log"

sudo docker stop jenkins2-data && sudo docker rm -v jenkins2-data
sudo docker run -u 1000 --name jenkins2-data -v "$data_path":/var/jenkins_home:z -v "$log_path":/var/log/jenkins:z jenkins2-data

