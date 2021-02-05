You will now run a Docker container for Jupyter Notebook. Note: this may take up to 3 minutes, because of the size of the container image.

## Install JupyterLab

Jupyter lab install

`python3 -m pip install jupyterlab`{{execute}}

Run the Jupyter Notebook container image:

`jupyter-lab --allow-root --port=8888 --expose-app-in-browser`{{execute}}
