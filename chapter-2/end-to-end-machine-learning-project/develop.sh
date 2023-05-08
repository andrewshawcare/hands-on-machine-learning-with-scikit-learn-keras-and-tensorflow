#!/bin/zsh

# Setup and activate Python virtual environment

python3 -m venv .venv
source .venv/bin/activate

# Install dependencies

pip install --requirement requirements.txt --constraint constraints.txt

# Setup local Jupyter config and data directories
# See:
#   * https://docs.jupyter.org/en/latest/use/jupyter-directories.html
#   * https://github.com/jupyter/jupyter_core/blob/main/jupyter_core/paths.py

JUPYTER_CONFIG_DIR="${PWD}/.jupyter"
mkdir "${JUPYTER_CONFIG_DIR}"
export JUPYTER_CONFIG_DIR

export JUPYTER_DATA_DIR="${JUPYTER_CONFIG_DIR}/data"
mkdir "${JUPYTER_DATA_DIR}"

# See: https://stackoverflow.com/questions/67797152/what-is-the-difference-between-jupyter-notebook-and-jupyter-server/67804732#67804732

jupyter server extension disable nbclassic

# See: https://jupyterlab.readthedocs.io/en/stable/user/announcements.html

upyter labextension disable "@jupyterlab/apputils-extension:announcements"

# See: https://discourse.jupyter.org/t/debugger-warning-it-seems-that-frozen-modules-are-being-used-python-3-11-0/16544

export PYDEVD_DISABLE_FILE_VALIDATION=1

exec jupyter lab --notebook-dir=.