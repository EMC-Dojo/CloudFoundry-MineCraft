# EMC Dojo Cloudfoundry Minecraft

![alt text](http://www.vtexan.com/wp-content/uploads/2016/07/Minecraft-Docker-.png "Logo Title Text 1")    
(Image Credit @Rick_Scherer)  

## Project: EMC Dojo Team Minecraft + Docker + CloudFoundry + ScaleIO + REX-Ray demo.


## Process

This documentation is based on Mac OSX:  
Open Terminal  
Create a projects folder "mkdir projects"  

### Persistent Storage

![alt text](http://www.vtexan.com/wp-content/uploads/2016/07/Vagrant-ScaleIO-RexRay.png "Logo Title Text 1")      
(Image Credit @Rick_Scherer)  

For the persistent storage part of this demo, we will be using the EMC{CODE} Vagrant Package.  You will need to install the following vagrant-triggers plugin:

`vagrant plugin install vagrant-triggers`

 `git clone https://github.com/emccode/vagrant`  
 `cd vagrant/scaleio`
 `vagrant up`

This process will automatically deploy three CentOS 7.1 nodes, download the ScaleIO 2.0 software and install a full ScaleIO Cluster with GUI. It will also setup Docker and REX-Ray to give the containers storage persistence.  Please note, more REX-Ray information can be found here:  

  `https://github.com/emccode/vagrant/tree/master/rexray`

You can find more documentation on this vagrant setup here: `https://github.com/emccode/vagrant/tree/master/scaleio`    

Once ScaleIO is done, you can launch the GUI - `projects/vagrant/scaleio/gui/run.sh.` (Just use Finder on your Mac and drag the run.sh file into Terminal and hit enter)
Username = admin  
Password = Scaleio123  

### Minecraft

Once ScaleIO is up and running, and you've verified it with the GUI - SSH into one of the CentOS servers
`vagrant ssh tb` (this is the tiebreaker node, you can use the mdm1 or mdm2 node if you want as well)  


this will download and setup minecraft 1.10.2 and we've altered the server.properties of this game with spawn-monsters=off for demo purposes.  You can edit the server.properties=true if you want to play the game with monsters.  
We also altered level-name=../data to place the Minecraft world on a REX-Ray attached volume mount called /data  

`sudo docker run -p 25565:25565 --volume-driver=rexray -v minecraft-data:/data emcdojo/minecraft `

### Questions / Comments / Snide Remarks  
Ask any questions, make comments, etc on the community.emccode.com Slack Channel - post them in the EMC channel specifically

### Maintainer  
* Tommy Trogden = <a href="http://twitter.com/vtexan" target="_blank" >@vTexan</a>
* Brian Verkley = [@BVerkley] (http://twitter.com/BVerkley)
* Fabio Chiodini = [@FabioChiodini] (http://twitter.com/FabioChiodini)
