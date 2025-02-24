#!/bin/sh

# Создаем директорию, если она не существует
mkdir -p /etc/kafka

# Копируем файл конфигурации в директорию secrets
cp /kafka_server_jaas.conf /etc/kafka/

# Заменяем плейсхолдеры в файле конфигурации на значения переменных окружения
sed -i "s/\${KAFKA_PASSWORD}/${KAFKA_PASSWORD}/g" /etc/kafka/kafka_server_jaas.conf
sed -i "s/\${KAFKA_USERNAME}/${KAFKA_USERNAME}/g" /etc/kafka/kafka_server_jaas.conf

# Запускаем Kafka сервер
exec start-kafka.sh