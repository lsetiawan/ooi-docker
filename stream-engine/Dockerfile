FROM continuumio/anaconda:latest

# Temp ingest engine grab from conda
RUN conda create -n tmp-stream -c ooi --yes python=2.7 stream_engine
# install stream engine
# COPY stream_engine/ /stream_engine
RUN cp -R /opt/conda/envs/tmp-stream/stream_engine /stream_engine
RUN conda env remove -n tmp-stream

COPY configure.sh /configure.sh
COPY local.py /stream_engine/config

RUN conda env create -f /stream_engine/conda_env.yml \
    && conda install -c conda-forge -n stream --yes psycopg2

# create our async output volume
RUN mkdir -p /opt/ooi/async && bash /configure.sh
VOLUME ["/opt/ooi/async"]

EXPOSE 5000

WORKDIR /stream_engine
CMD ["/opt/conda/envs/stream/bin/gunicorn", "--log-config", "logging.conf", "--config", "gunicorn_config.py", "engine.routes:app"]
