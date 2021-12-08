FROM gitpod/workspace-full:latest

# set the python version to install
ARG PYTHON_VERSION
ENV PYTHON_VERSION=${PYTHON_VERSION:-3.9.9}

# move pyenv to a persitent location
RUN pyenv update && pyenv install $PYTHON_VERSION && pyenv global $PYTHON_VERSION \
    && python3 -m pip install --no-cache-dir --upgrade pip \
    && sudo rm -rf /tmp/*

# fix non persistent pip packages: https://github.com/gitpod-io/gitpod/issues/7077
ENV PIP_USER=yes