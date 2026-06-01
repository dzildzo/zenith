FROM ubuntu:24.04

# Устанавливаем Java 17, утилиту curl для скачивания и ca-certificates
RUN apt-get update && apt-get install -y --no-install-recommends openjdk-17-jre-headless curl ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Скачиваем стабильный JAR-файл Zenith Proxy напрямую
RUN curl -L -o zenith.jar https://github.com

# Копируем конфиг из твоего репозитория внутрь сервера
COPY config.yml .

# Уведомляем хостинг, какой порт слушать. 
# Render автоматически дает порт через переменную среды, но мы также фиксируем порт 10000
EXPOSE 10000

# Запускаем чистую Java без капризных лаунчеров и без ожидания ввода в консоли
CMD ["java", "-jar", "zenith.jar", "--no-console", "<", "/dev/null"]
