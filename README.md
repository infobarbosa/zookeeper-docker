# zookeeper-docker
Imagem do ZooKeeper para Docker

Por enquanto estou trabalhando com um assembly standalone entao o comando seria: 

docker run [OPCOES] infobarbosa/zookeeper:standalone

OPCOES
	Padrao do docker. Aqui eu uso bastante as -d (dettached) mais --ip e --net (sendo que net eu uso uma chamada netlab com gateway em 172.18.0.1 - essa informacao só é importante pra você se for fazer os outros labs. Kafka, por exemplo)

