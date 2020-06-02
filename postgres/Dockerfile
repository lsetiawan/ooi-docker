FROM mdillon/postgis:9.2

# -- Install conda --
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN cd /opt \
    && git clone https://github.com/oceanobservatories/preload-database.git \
    && /opt/conda/bin/conda env create -f /opt/preload-database/conda_env.yml

COPY ./init_schema.py /init_schema.py
COPY ./initdb-ooi.sh /docker-entrypoint-initdb.d/zz_ooi.sh
