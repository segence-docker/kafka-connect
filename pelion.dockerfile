FROM confluentinc/cp-kafka-connect-base:6.2.0

ARG PELION_PLUGIN_VERSION=1.0.3

RUN confluent-hub install pelion/kafka-connect-pelion:${PELION_PLUGIN_VERSION} --no-prompt
