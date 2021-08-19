sample-integration

Key points to make this works

1. Create a new github repository for your new project
2. In your local machine execute the following
    Option 1: Create a new repository   
        On your working directory(you can create a spesipic folder to work on)
        echo "repository_name" >> README.md
        git init
        git add README.md
        git commit -m "first commit"
        git branch -M main
        git remote add origin https://"Your repository URL"
        git push -u origin main

    Optiona 2: push an existing repositiry
        git remote add origin https://"Your repository URL"
        git branch -M main
        git push -u origin main
3. On Jenkins createa a new project 
    3.1 : CREATE NEW ITWM 
        - enter repository name on the first field
        - for now choose Frestyle project and then press OK
        - GENERAL: choose > GitHub project
            PROJECT URL: repository URL without extension name .git > https://github.com/user/repository_name
        - SOURCE CODE MANAGEMENT: choose > Git
            REPOSITIRY URL: repository URL > https://github.com/user/repository_name.git
            BRANCH TO BUILD: Leave it empty
        - BUILD TRIGGERS:
            - CHOOSE: Poll SCM
                - [ * * * * * ] if you like to run build every minute
                - [ H/02 * * * * ] if you want to run build every to minutes
            - CHOOSE: GitHub hook trigger for GITScm polling
                - if you want to run build everytime thers a new push on the repository but need extra configuration to undergo/
        - BUILD
            ADD BULD STEP
            - CHOOSE: Invoke top level Maven targets
                - MAVEN VERSION: choose appropriate one that you setup on jenkins
                - GOALS : "Install" or "Clean Install"
            
                Options when Building and Pubplishing Docker
                - DCOKER BUILD AND PUBLISH
                    -REPOSITOORY NAME: docker_hud account : account_name/docker_image_file_you_are_building
                        - NOTE: need to login to docker into your local machine : docker login -u usernam -p password
                    - REGISTRY CREDENTIALS: add docker_hub credentials you configure on jenkins.
                        - In Jenkins > Manage Jenkins > Manage Credentials > CLick on Jenkins on Store scoped > Global credentials(unrestricted) > On the right click ADD CREDENTAILS.
    


INSTALLING DOCKER ON UBUNUT

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo systemctl status docker




MANAGE DOCKER AS A NON ROOT ON UBUNTU

sudo groupadd docker


sudo usermod -a -G docker jenkins

