FROM eclipse-temurin:17-jre-alpine

# Устанавливаем curl для скачивания
RUN apk add --no-cache curl

WORKDIR /app

# Скачиваем оригинальный рабочий .jar файл напрямую.
# Цикл проверяет размер файла: если GitHub отдал ошибку, он качает заново, пока не скачает все 15+ МБ.
RUN for i in $(seq 1 5); do \
    curl -L -o zenith.jar https://github.com && \
    [ $(stat -c%s zenith.jar) -gt 10000000 ] && break || sleep 2; \
    done

# Копируем твой конфиг из репозитория
COPY config.yml .

# Открываем порт для Render
EXPOSE 10000

# Запуск чистой Java без консоли на порту 10000
CMD ["java", "-jar", "zenith.jar", "--bind-port", "10000", "--no-console"]

