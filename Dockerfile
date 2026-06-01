FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Просто копируем файл Zenith-Proxy.jar и конфиг прямо из твоего репозитория
COPY Zenith-Proxy.jar ./zenith.jar
COPY config.yml .

EXPOSE 10000

# Запуск чистой Java без консоли
CMD ["java", "-jar", "zenith.jar", "--bind-port", "10000", "--no-console"]


