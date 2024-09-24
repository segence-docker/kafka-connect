FROM confluentinc/cp-kafka-connect-base:7.7.1

ARG JDBC_PLUGIN_VERSION=10.7.12
ARG MYSQL_JDBC_VERSION=8.0.33

RUN confluent-hub install confluentinc/kafka-connect-jdbc:${JDBC_PLUGIN_VERSION} --no-prompt && \
    wget --progress=dot:giga https://repo1.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_JDBC_VERSION}/mysql-connector-java-${MYSQL_JDBC_VERSION}.jar -O /usr/share/confluent-hub-components/confluentinc-kafka-connect-jdbc/lib/mysql-connector-java-${MYSQL_JDBC_VERSION}.jar