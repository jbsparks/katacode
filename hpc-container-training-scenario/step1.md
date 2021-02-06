You will now run a Docker container for Jupyter Notebook. Note: this may take up to 3 minutes, because of the size of the container image.

## Install JupyterLab

Jupyter lab install

### First update pip

Seems you have to do this all the time ...
`python3.8 -m pip install --upgrade pip`{{execute}}

### Install jupyterlab

`python3 -m pip install jupyterlab`{{execute}}

Run the Jupyter Notebook container image:

`jupyter-lab --allow-root --port=9888 --notebook-dir=. --no-browser`{{execute}}

