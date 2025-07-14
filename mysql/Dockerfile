FROM confluentinc/cp-kafka-connect-base:7.9.2

ARG JDBC_PLUGIN_VERSION=10.8.4
ARG MYSQL_JDBC_VERSION=8.0.30

RUN confluent-hub install confluentinc/kafka-connect-jdbc:${JDBC_PLUGIN_VERSION} --no-prompt && \
    wget --progress=dot:giga https://repo1.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_JDBC_VERSION}/mysql-connector-java-${MYSQL_JDBC_VERSION}.jar -O /usr/share/confluent-hub-components/confluentinc-kafka-connect-jdbc/lib/mysql-connector-java-${MYSQL_JDBC_VERSION}.jar