# --- ЭТАП 1: Сборка прокси из исходного кода ---
FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /build

# Клонируем официальный исходный код ZenithProxy
RUN git clone https://github.com .

# Собираем чистый, рабочий .jar файл без тестов
RUN mvn clean package -DskipTests

# --- ЭТАП 2: Запуск готового приложения ---
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Копируем свежесобранный .jar файл из первого этапа
COPY --from=builder /build/target/Zenith-Proxy-*.jar ./zenith.jar

# Копируем ваш конфигурационный файл config.yml
COPY config.yml .

EXPOSE 10000

# Запуск чистой Java на порту Render без лаунчеров и зависаний консоли
CMD ["java", "-jar", "zenith.jar", "--no-console"]


