# FROM continuumio/anaconda3:2020.11
FROM continuumio/anaconda3:2022.10

RUN apt-get update && apt-get install -y \
    vim \
    p7zip-full \
    unzip \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

# Install packages
ARG env_name=nilmtk-env
RUN conda create --name ${env_name} -y python=3.8 && conda config --add channels conda-forge
COPY files/requirements.nilmtk_contrib.txt /tmp
RUN conda init bash && . ~/.bashrc && conda activate nilmtk-env \
  && pip install git+https://github.com/nilmtk/nilmtk@0.4.3 \
  && pip install git+https://github.com/nilmtk/nilm_metadata@0.2.4 \
  && pip install --no-deps git+https://github.com/nilmtk/nilmtk-contrib \
  && pip install -r /tmp/requirements.nilmtk_contrib.txt

# Activate environment
ENV CONDA_DEFAULT_ENV ${env_name}

# Switch default environment
RUN echo "conda activate ${env_name}" >> ~/.bashrc
ENV PATH /opt/conda/envs/${env_name}/bin:$PATH

# Install a jupyter kernel
RUN python -m ipykernel install --user --name ${env_name} --display-name "Python3.8 (nilmtk-env)"

# Add jupyter configuration
ENV HOME /root
RUN mkdir $HOME/.jupyter
COPY files/jupyter_notebook_config.py $HOME/.jupyter/

WORKDIR /workspace

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
