FROM continuumio/anaconda:latest

COPY environment.yml /environment.yml

RUN conda update --yes conda \
    && conda env create -f /environment.yml

# Temp ingest engine grab from conda
RUN conda create -n tmp-ingest -c ooi --yes python=2.7 ingest_engine
# COPY ingest_engine/ /ingest_engine
RUN cp -R /opt/conda/envs/tmp-ingest/ingest_engine /ingest_engine
RUN conda env remove -n tmp-ingest

COPY configure.sh /configure.sh
RUN bash /configure.sh && mkdir /data

EXPOSE 5001
WORKDIR /ingest_engine
VOLUME ["/data"]
CMD ["/opt/conda/envs/ingest/bin/gunicorn", "--pythonpath", ".", "--log-config", "logging.conf", "--config", "gunicorn_config.py", "engine.routes:app"]
