#Copia o arquivo de proprieades do diretorio de transferencia para o diretorio do zookeeper
cp /tmp/zookeeper/zoo.properties /opt/zookeeper/conf/zoo.properties

if [ -n "$MYID" ]; then
  echo $MYID > /var/zookeeper/data/myid
fi

#Inicializa do zookeeper
/opt/zookeeper/bin/zkServer.sh 

