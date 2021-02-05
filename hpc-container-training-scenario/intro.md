In this scenario, you will run a Jupyter Notebook in a Docker Container.

The underlying Ubuntu Container Image. It contains the following contents:
* Functional Jupyter-lab Notebook server
* Miniconda Python 3.x in /opt/conda
* Pandoc and TeX Live for notebook document conversion
* git, emacs, jed, nano, and unzip
* ipywidgets for interactive visualizations in Python notebooks
* Facets for visualizing machine learning datasets

The scenario also deploys a predefined Jupyter Notebook by cloning a GitHub repository. You are free to add additional notebooks in a similar way - or upload them from your own collection.  

Finally, you will access the Jupyter Notebook and start playing with it.
