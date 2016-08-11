sed -i 's/localhost/qpid/g' edex/data/utility/edex_static/base/ooi/config/alertAlarm.json
sed -i 's/localhost/qpid/g' edex/etc/*.sh
sed -i 's/DB_ADDR=localhost/DB_ADDR=postgres/g' edex/bin/setup.env
sed -i 's/BROKER_ADDR=localhost/BROKER_ADDR=qpid/g' edex/bin/setup.env
sed -i 's/contactpoints=127.0.0.1/contactpoints=cassandra/g' edex/data/utility/edex_static/base/ooi/ooi_configure.properties
sed -i 's;ooi.stream_engine.url=http://localhost:5000;ooi.stream_engine.url=http://stream_engine:5000;g' edex/data/utility/edex_static/base/ooi/ooi_configure.properties
