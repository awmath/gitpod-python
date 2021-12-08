FROM gitpod/workspace-full:latest

# set the python version to install
ARG PYTHON_VERSION
ENV PYTHON_VERSION=${PYTHON_VERSION:-3.9.9}

# 
ENV PYENV_ROOT=/workspace/.pyenv
ENV PATH="${PYENV_ROOT}/bin:${PATH}"

RUN pyenv update && pyenv install $PYTHON_VERSION && pyenv global $PYTHON_VERSION \
    && python3 -m pip install --no-cache-dir --upgrade pip \
    && python3 -m pip install --no-cache-dir --upgrade \
        setuptools wheel virtualenv pipenv pylint rope flake8 \
        mypy autopep8 pep8 pylama pydocstyle bandit notebook \
        twine \
    && sudo rm -rf /tmp/*