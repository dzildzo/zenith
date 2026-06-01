# Используем готовый и проверенный образ Zenith Proxy от комьюнити
FROM brickmasterhunt/zenithproxy:latest

WORKDIR /app

# Копируем ваш конфигурационный файл
COPY config.yml .

# Render требует порт 10000 для бесплатных веб-сервисов
EXPOSE 10000

# Запускаем прокси, принудительно указав порт 10000 через аргументы запуска Java
CMD ["java", "-jar", "Zenith-Proxy.jar", "--bind-port", "10000", "--no-console"]

