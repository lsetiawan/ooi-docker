FROM continuumio/anaconda:latest

RUN conda update --yes conda \
    && conda install --yes python=2.7.10 matplotlib mock flask sqlalchemy futures gunicorn ipython msgpack-python nose \
    && conda install --yes -c ooi concurrentloghandler ntplib
RUN pip install simplejson
RUN git clone https://github.com/oceanobservatories/mi-dataset && pip install ./mi-dataset && rm -rf mi-dataset

COPY ingest_engine/ /ingest_engine
COPY configure.sh /configure.sh
RUN bash /configure.sh && mkdir /data

EXPOSE 5001
WORKDIR /ingest_engine
VOLUME ["/data"]
CMD ["gunicorn", "--pythonpath", ".", "--log-config", "logging.conf", "--config", "gunicorn_config.py", "engine.routes:app"]
