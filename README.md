# MAXIV2025-HPC access and Data-processing-for-Beginners
In this repository you will find the basic level of understanding to access the MAXIV offline cluster and execute the data processing. <br/>
Make sure you have a DUO account and access it! <br/>
Use the following link to access DUO <br/>
https://www.maxiv.lu.se/user-access/duo-guides/duo-account-creation-login/ <br/>
Pre-setup; <br/>
Activate OTP using the link: <br/>
https://www.maxiv.lu.se/beamlines-accelerators/controls-it/it-services/one-time-password-otp/  <br/>
Install VPN; <br/>
https://www.maxiv.lu.se/beamlines-accelerators/controls-it/it-services/connect-via-vpn/ <br/>
Remote accesslink; <br/>
https://pritunl-white.maxiv.lu.se/ <br/> 
To download printunl, use the link; <br/>
https://client.pritunl.com/#install <br/>
Install printunl <br/>
When installed click on printunl <br/>
Enter your login details <br/>
Click Connect <br/>
Now a MAXIV login webpage opensup and here click on MAXIV account <br/>
Enter your DUO login credentials and click signin <br/>
Now you will get a OTP in the app authenticator (I use Microsoft authenticator) use it to connect to the HPC. <br/>
Download and install the ThinLinc Client interface, which we use as a interface with HPC. <br/>
Link to download, install and its information; <br/>
https://www.maxiv.lu.se/beamlines-accelerators/controls-it/it-services/remote-desktop/ <br/> 
When Thinlinc client is installed, open it. <br/>
Fill the server field wth offline-fe1.maxiv.lu.se <br/>
Fill it with your username and password <br/>
When you enter the login details and click connect, A Welcome to ThinLinc page appears. <br/>
Click Start and Now you are connected with an interface with the HPC!! <br/>
Please use the MAXIV-Github-HPCaccess.pdf as a graphical reference if required. <br/>

When you are in the login screen,
Click terminal

Change the directory to process the data; <br/>
Fox example the general path for offiline data users is where they can process the data is   `/gpfs/offline1/visitors/micromax/Project_No/Datacollectiondate/process/` <br/>
#Change directory to the path where you can run data processing <br/>
`cd /gpfs/offline1/visitors/micromax/Project_No/Datacollectiondate/process/` <br/>
#Create a directory where you want to process the data for ex.<br/>
`mkdir tutorial` <br/>
#Change directory to the tutorial
`cd tutorial` <br/>
#Now the first step, create .lst file, which is an input file for the program indexamajig of the crystfel <br/>
#First check the .h5 files at the directory under raw. <br/>
`ls /gpfs/offline1/visitors/micromax/Project_No/Datacollectiondate/Sample name/Run Number/raw/*.h5` <br/>  
#Use GUI crystfel to see the .h5 images. Use the following commands to load crystfel in the current directory. <br/>
#First change directory to where the .h5 files are there <br/>
`cd /gpfs/offline1/visitors/micromax/Project_No/Datacollectiondate/Sample name/Run Number/raw/ ` <br/> 
#Now in the current directory load the crystfel <br/>
`module load gopresto` <br/>
`module load PReSTO` <br/>
`crystfel` <br/>
#To see the diffraction images; load any .h5 file and geometry file (file.geom) by clickcing load data <br/>
#Browse through several images to see the difference between the images with diffraction spots and without diffraction spots <br/>
#Close this and coma back to previous working folder <br/>
`cd /gpfs/offline1/visitors/micromax/Project_No/Datacollectiondate/process/tutorial/` <br/>
#Now we will create a simple dataset_run.lst file which will have all the path of h5 file <br/>
`ls /gpfs/offline1/visitors/micromax/Project_No/Datacollectiondate/Sample name/Run Number/raw/*.h5` > make_list_run1.lst <br/>
#Now do `ls` command in the current directory to see run1.lst file is created <br/>
#A simple bash script to create a lst file from several runs (use gedit and save) I use vi editor. <br/>
`gedit make_list.sh` <br/>
#Type the following command <br/>
#!/bin/bash <br/>
`ls /gpfs/offline1/visitors/micromax/Project_No/Datacollectiondate/Sample name/Run Number/raw/*.h5` > make_list_run1.lst <br/>
`ls /gpfs/offline1/visitors/micromax/Project_No/Datacollectiondate/Sample name/Run Number/raw/*.h5` > make_list_run2.lst <br/>
`ls /gpfs/offline1/visitors/micromax/Project_No/Datacollectiondate/Sample name/Run Number/raw/*.h5` > make_list_run3.lst <br/>
#Save and Close <br/>
#Now you have the make_list.sh script file <br/>  
#Make it executable using the following command <br/>
`chmod a+x make_list.sh` <br/>
#To execute the script type <br/>
`./make_list.sh` <br/>
#Now do `ls` command in the current directory to see the nuber of .lst file for example here it will be make_list_run1.lst, make_list_run2.lst and make_list_run3.lst <br/>
#Get the geometry file (file.geom) with the mask file location (mask.h5) from the beam line scientist and copy it to the present directory. <br/>
#Copy the cell parameter file to the present directory, file.cell <br/>
#In the current directory we have .lst file, .geom file and .cell file. <br/>







