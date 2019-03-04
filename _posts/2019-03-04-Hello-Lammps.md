---
layout:     post
title:      Hello, LAMMPS!
subtitle:   
date:       2019-03-04
header-img: img/posts/Hello, LAMMPS!/header_bg.png
catalog: true
mathjax: false
tags:
    - Configuration
    - Molecular Dynamics
---


> Large-scale Atomic/Molecular Massively Parallel Simulator (LAMMPS) is a molecular dynamics program from Sandia National Laboratories.



### 1 Installation on Ubuntu

#### 1.1 Install Dependency

Install relative dependency on you Linux operating system.
```
sudo apt-get install gcc
sudo apt-get install g++
sudo apt-get install gfortran
sudo apt-get install make
```

Download and extract **[fftw-3.3.8.tar.gz](http://www.fftw.org/download.html)** and **[mpich-3.2.tar.gz](http://www.mpich.org/downloads/versions/)**.

Install FFTW3:
```
cd %fftw3%   # the directoty you extract to
sudo ./configure --prefix=/usr/local --enable-float 
sudo make -j4
sudo make install
```
Install MPICH:
```
cd %mpich%   # the directoty you extract to
sudo ./configure --prefix=/usr/local
sudo make -j4
sudo make install
```

#### 1.2 Install LAMMPS 

Download and extract **[lammps-stable.tar.gz](https://lammps.sandia.gov/tars/)**. 

Comment this line in **%lammps%/src/MAKE/Makefile.mpi** (Add '#'):
```
LMP_INC = -DLAMMPS_GZIP -DLAMMPS_MEMALIGN=64
```

Then install LAMMPS with commands:
```
cd %lammps%/src   # the directoty you extract to
sudo make mpi -j4
```

#### 1.3 Run LAMMPS

Run LAMMPS with following lines:
```
cd %lammps%/examples/shear/
/usr/local/bin/mpirun -np 4 /home/%username%/%lammps%/src/lmp_mpi < in.shear  
```
![LAMMPS Trial]({{site.url}}/img/posts/{{page.title}}/lammps_trial.png)


---


### 2 Installation on Windows

#### 2.1 Enable .Net Framework 2.0

**For Windows 7, Windows 8, Windows 10:**

Control Pannel > Turn Windows features on or off.

![Enable .Net Framework]({{site.url}}/img/posts/{{page.title}}/enable_dotnet_framework.png)

Then .Net Framework 2.0 will be automatically installed.

**For Windows Server 2003, Windows XP:**

Download and install [Service Pack 2 for .NET Framework 2.0](https://www.microsoft.com/zh-CN/download/details.aspx?id=1639) manually. 

#### 2.2 Install LAMMPS

Download LAMMPS [here](http://packages.lammps.org/windows.html). 

![Download LAMMPS]({{site.url}}/img/posts/{{page.title}}/download_lammps_win.png)

Click on 64-bit Windows download area, where you can find all versions of LAMMPS for 64-bit Windows.

Download and install LAMMPS-64bit-XXXXX-**MPI**.exe for multi-threaded parallel calculation.

![Download LAMMPS]({{site.url}}/img/posts/{{page.title}}/download_lammps_mpi.png)

#### 2.3 Install MPICH2

For multi-threaded parallel calculation, you will need MPICH2. You can also download MPICH2 [here](http://packages.lammps.org/windows.html). 

![Download MPICH2]({{site.url}}/img/posts/{{page.title}}/download_mpich2.png)

Double click on mpich2-1.4.1p1-win-x86-64.msi to install.

After that, run **wmpiregister.exe** in %MPICH2%/bin. Enter your Windows user account and password, then click "Register".

![Register MPICH2]({{site.url}}/img/posts/{{page.title}}/mpich_register.png)

#### 2.4 Run LAMMPS

Make sure environment variable has following items:

- %MPICH2%\bin

- %LAMMPS%\bin

![Windows Environment Variable]({{site.url}}/img/posts/{{page.title}}/environment_variable_win.png)


Run Command Prompt as Administrator.

Change directoty to some folder as workspace.

Run LAMMPS with following lines:
```
mpiexec -localonly 4 lmp_mpi -in hello_world.in  
```