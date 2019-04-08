# WindowsDocker-Dockercon18
This repo pertains to the dockerization (windows containers) demonstrated during my presentation at Dockercon '18 (Innovation Track) - Packaging Software for the Distribution on the Edge with Docker and Windows Server

## Reference Information
This repo has been created in reference to the following materials:
* Dockercon '18 Presentation Slide Deck - https://www.slideshare.net/Docker/packaging-software-for-the-distribution-on-the-edge
* Dockercon '18 Presentation Conference Video - https://dockercon2018.hubs.vidyard.com/watch/Eim9XbzsK8WvsxiGAv4Jwe

## Environment Setup

### OS platform
The required OS to host this build is a Windows Server 2016 platform. If you are trying to provide this on your own accord, this may be somewhat costly.  Here is a link to acquire a Windows Server 2016 ISO (installer) which acts as a trial for 180 days: 

* https://www.microsoft.com/en-us/evalcenter/evaluate-system-center-2016

The simpliest way to acquire an environment would be to build up a VM utilizing the Windows Server 2016 ISO installer.  There are a few VM hypervisors available for you to use.  A free one can be found here: 

* https://www.virtualbox.org/wiki/Downloads

### Docker environment
Once you have an OS, install Docker Enterprise Edition. Instructions to perform this can be found here: 

* https://blogs.technet.microsoft.com/canitpro/2016/10/26/step-by-step-setup-docker-on-your-windows-2016-server/

### Build environment
Both the OS and Docker are considered compulsory.  Once this has been established, now, one can start to build docker images.  

After cloning this repo, you should now have the following subdirectories:

* 3rdpartylibs
* Prereq
* ProgramFiles-MyProgram

NOTE -- this repo will act as a template towards building your own application.  The original contents of the above 3 directories have been altered to remove any company specific proprietary intellectual property.  However, these should act as a template to generically build any asp.net app.

After you fill in your dependency libraries in 3rdpartylibs, prerequisite programs in Prereq, and programmatic files in ProgramFiles-MyProgram you should now be ready to perform a docker build.

## Build Process
Within this directory, there will be 2 files:

* DockerFile
* DockerFile.manual.bat

Run the following command to build the first image (may take some time depending on the size of your program - behind a corporate firewall with a 3.5GB program took me about a half hour):
> docker build -t myprogram-int .

After completing the above, you will have an image that contains IIS and ready to run.  Now, run the image:
> docker run -d -p 80:80 -v c:/ProgramData-MyProgram:c:/ProgramData/MyProgram --name myprogram-app myprogram-int

Next, we're going to intercept the running container and start manipulating it by running the command.  The following command will open a powershell into the container:
> docker exec -i myprogram-app powershell

While in the powershell, execute the commands contained in Dockerfile.manual to deploy the MyProgram web application.  While the above powershell is still open, open a new Powershell session in a new window.  Then perform the following commands to stop the docker container and then save the state of the container into a new docker image, called myprogram:
> docker ps  // obtain the <container_id> of the running docker container <br/>
> docker stop <container_id> <br/>
> docker commit <container_id> myprogram

At the end of this, you will have a working docker image in your local docker registry called myprogram
