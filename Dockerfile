FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Копируем переименованный файл и конфиг из вашего репозитория
COPY zenith.jar .
COPY config.yml .

EXPOSE 10000

# Запуск прокси
CMD ["java", "-jar", "zenith.jar", "--bind-port", "10000", "--no-console"]




