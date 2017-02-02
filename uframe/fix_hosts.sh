export AA=edex/data/utility/edex_static/base/ooi/config/alertAlarm.json
export ETC=edex/etc/*.sh
export SETUP=edex/bin/setup.env
export BASE_PROP=edex/data/utility/edex_static/base/ooi/ooi_configure.properties

sed -i 's/localhost/qpid/g' $AA
sed -i 's/localhost/qpid/g' $ETC
sed -i 's/DB_ADDR=localhost/DB_ADDR=postgres/g' $SETUP
sed -i 's/BROKER_ADDR=localhost/BROKER_ADDR=qpid/g' $SETUP
sed -i 's/INIT_MEM=512/INIT_MEM=1536/g' edex/etc/ooi.sh

sed -i 's/contactpoints=127.0.0.1/contactpoints=cassandra/g' $BASE_PROP
sed -i 's;ooi.stream_engine.url=http://localhost:5000;ooi.stream_engine.url=http://stream_engine:5000;g' $BASE_PROP
