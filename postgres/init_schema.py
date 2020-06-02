from sqlalchemy import create_engine
import logging
from ooi_data.postgres.model.base import MetadataBase, MonitorBase

log = logging.getLogger(__name__)
log.setLevel(logging.INFO)
logging.basicConfig()


if __name__ == "__main__":
    url = 'postgresql://awips:awips@localhost/metadata'
    engine = create_engine(url, echo=True)
    log.info("Create Metadata ...")
    MetadataBase.metadata.create_all(engine)
    log.info("Create Monitor ...")
    MonitorBase.metadata.create_all(engine)

