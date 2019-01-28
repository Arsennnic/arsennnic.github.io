---
layout:     post
title:      Hello, Lammps!
subtitle:   
date:       2019-01-25
header-img: img/posts/Hello, Lammps!/header_bg.png
catalog: true
mathjax: false
tags:
    - Configuration
    - Molecular Dynamics
---


> Large-scale Atomic/Molecular Massively Parallel Simulator (LAMMPS) is a molecular dynamics program from Sandia National Laboratories.


### 1 Install Dependency

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



### 2 Install Lammps 

Download and extract **[lammps-stable.tar.gz](https://lammps.sandia.gov/tars/)**. 

Comment this line in **%lammps%/src/MAKE/Makefile.mpi** (Add '#'):
```
LMP_INC = -DLAMMPS_GZIP -DLAMMPS_MEMALIGN=64
```

Then install Lammps with commands:
```
cd %lammps%/src   # the directoty you extract to
sudo make mpi -j4
```

### 3 A Simple Try

Uncomment this line in **%lammps%/examples/shear/in.shear** (delete '#'):
```
# dump 1 all atom 100 dump.shear
```

Then run Lammps with following lines:
```
cd %lammps%/examples/shear/
/usr/local/bin/mpirun -np 4 /home/%username%/%lammps%/src/lmp_mpi < in.shear  
```
![Lammps Trial]({{site.url}}/img/posts/{{page.title}}/lammps_trial.png)