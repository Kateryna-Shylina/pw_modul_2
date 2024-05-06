# Docker-команда FROM вказує базовий образ контейнера
# Наш базовий образ - це Linux з попередньо встановленим python-3.10
FROM python:3.12

# Встановимо змінну середовища
ENV APP_HOME /app

# Встановимо робочу директорію всередині контейнера
WORKDIR $APP_HOME

# Скопіюємо інші файли в робочу директорію контейнера
COPY Pipfile $APP_HOME/Pipfile
COPY Pipfile.lock $APP_HOME/Pipfile

# Встановимо залежності всередині контейнера
RUN pip install pipenv
RUN pip install prompt_toolkit
RUN pip install prompt
RUN pip install uuid

COPY . .

# Позначимо порт, де працює застосунок всередині контейнера
EXPOSE 5000

# Запустимо наш застосунок всередині контейнера
ENTRYPOINT ["python", "src/main.py"]