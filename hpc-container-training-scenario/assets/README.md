# HPCaaS Workshops

This workshop uses jupyter notebooks to guide the user throght various steps in building containers using either _docker_ or _podman_ and converts these _OCI_ containers to _singularity_ containers. 

The workshop covers the follwoing topics:

* Brief intoduction to _docker_ and _singularity_
* Containers for __HPC__
* Container image formats
* Building _OCI_ (docker/podman) and singularity containers
* Image layers and sizes
* Manageing container environments
* HPC Containers
> * HPC Environments, MPI, CUDA, Compilers
> * HPC example - miniWeather model
* Summary


# Workshop platform

## Platform 
To run the notebook, you will need jupyter installed bare metal, along with the following
* _docker_ or _podman_
* singularity 3.x
* Jupyterlab

## Jupyter Startup

E.g. Using our CentOS.8 server as a base. __Note__ the IP address
```bash
dnf install -y nodejs npm
python3 -m pip install jupyterlab
jupyter-lab --allow-root --port=8888 --ip=192.168.149.12 --expose-app-in-browser
```
Once started the stdout will contain the connection string to use


## Get the code/workshop

Once the jupyter instance is running, you can open a terminal window and clone the repo from our gitlab instance
```bash
git config --global http.sslVerify false
git clone https://192.168.149.2:2443/jbsparks/hpcaas-workshops.git
```

Open the notebook file _HPCaaSWorkshop01.ipynb_ using the browser window, to start the workshop.
