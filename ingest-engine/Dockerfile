FROM continuumio/anaconda:latest

RUN conda update --yes conda \
    && conda install --yes python=2.7 matplotlib mock flask sqlalchemy futures gunicorn ipython msgpack-python nose \
    && conda install --yes -c ooi concurrentloghandler ntplib
RUN pip install simplejson
RUN git clone https://github.com/oceanobservatories/mi-dataset && pip install ./mi-dataset && rm -rf mi-dataset

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
CMD ["gunicorn", "--pythonpath", ".", "--log-config", "logging.conf", "--config", "gunicorn_config.py", "engine.routes:app"]
