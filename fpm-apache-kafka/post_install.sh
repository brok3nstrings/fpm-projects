/usr/bin/ln -s /opt/kafka/bin/kafka-server-start.sh /usr/bin
/usr/bin/ln -s /opt/kafka/bin/kafka-server-stop.sh /usr/bin
/usr/bin/sed -i "s/\${BROKER_ID}/$(cat /etc/hostname |awk -F'[^0-9]*' '{print $3}')/g" /etc/systemd/system/kafka.service
/usr/bin/sed -i "s/\${BROKER_ID}/$(cat /etc/hostname |awk -F'[^0-9]*' '{print $3}')/g" /etc/kafka/server.properties
/usr/bin/sed -i "s/\${BROKER_ID}/$(cat /etc/hostname |awk -F'[^0-9]*' '{print $3}')/g" /etc/sysconfig/kafka
/usr/bin/touch /tmp/zookeeper/myid
echo $(cat /etc/hostname |awk -F'[^0-9]*' '{print $3}') > /tmp/zookeeper/myid
