FROM confluentinc/cp-kafka-connect-base:6.2.0

ARG JDBC_PLUGIN_VERSION=10.2.4
ARG MYSQL_JDBC_VERSION=8.0.26

RUN confluent-hub install confluentinc/kafka-connect-jdbc:${JDBC_PLUGIN_VERSION} --no-prompt
RUN wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_JDBC_VERSION}/mysql-connector-java-${MYSQL_JDBC_VERSION}.jar -O /usr/share/confluent-hub-components/confluentinc-kafka-connect-jdbc/lib/mysql-connector-java-${MYSQL_JDBC_VERSION}.jar
