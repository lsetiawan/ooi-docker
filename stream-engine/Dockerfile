FROM continuumio/anaconda:latest

# install python packages
RUN conda update --yes conda \
    && conda install --yes python=2.7.10 xarray mock requests blist flask sqlalchemy futures gunicorn ipython msgpack-python nose netCDF4 numexpr \
    && conda install --yes -c ooi cassandra-driver ion-functions concurrentloghandler ntplib
RUN pip install -U pip && pip install cachetools simplejson && rm -rf /.python-eggs && rm -rf /.cache

# install stream engine
COPY stream_engine/ /stream_engine
COPY configure.sh /configure.sh

# create our async output volume
RUN mkdir -p /opt/ooi/async && bash /configure.sh
VOLUME ["/opt/ooi/async"]

EXPOSE 5000

WORKDIR /stream_engine
CMD ["gunicorn", "--log-config", "logging.conf", "--config", "gunicorn_config.py", "engine.routes:app"]
