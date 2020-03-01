FROM confluentinc/cp-kafka-connect-base:5.4.0

ARG AWS_SDK_VERSION=1.11.438
ARG KINESIS_SOURCE_PLUGIN_VERSION=1.1.4

RUN confluent-hub install confluentinc/kafka-connect-kinesis:${KINESIS_SOURCE_PLUGIN_VERSION} --no-prompt
RUN wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-sts/${AWS_SDK_VERSION}/aws-java-sdk-sts-${AWS_SDK_VERSION}.jar -O /usr/share/confluent-hub-components/confluentinc-kafka-connect-kinesis/lib/aws-java-sdk-sts-${AWS_SDK_VERSION}.jar

RUN confluent-hub install confluentinc/kafka-connect-s3:${CONFLUENT_VERSION} --no-prompt
