FROM continuumio/anaconda:latest

# install stream engine
COPY stream_engine/ /stream_engine
COPY configure.sh /configure.sh
COPY local.py /stream_engine/config

RUN conda env create -f /stream_engine/conda_env.yml

# create our async output volume
RUN mkdir -p /opt/ooi/async && bash /configure.sh
VOLUME ["/opt/ooi/async"]

EXPOSE 5000

WORKDIR /stream_engine
CMD ["/opt/conda/envs/stream/bin/gunicorn", "--log-config", "logging.conf", "--config", "gunicorn_config.py", "engine.routes:app"]
