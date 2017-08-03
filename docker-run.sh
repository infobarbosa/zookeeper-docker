#Comando RUN do docker com as variaveis para setup do zookeeper
docker run -d \
       --net bigdata \
       --ip 172.18.0.3 \
       --name zookeeper \
       infobarbosa/zookeeper:standalone 

