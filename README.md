# Sausage Store
## (Обновленная версия - финальный проект второго семестра) 
![image](https://user-images.githubusercontent.com/9394918/121517767-69db8a80-c9f8-11eb-835a-e98ca07fd995.png)

## Адрес проекта
https://front-alexanderpanov.2sem.students-projects.ru

## Структура проекта
```
sausage-store
├── .github/workflows # Файлы для сборки и деплоя с помощью GitHub Actions
│   └── main.yaml # Github-workflow файл для GitHub Actions
├── LICENSE
├── README.md
├── backend # Код приложения Backend
├── backend-report # Код приложения Backend-report
├── frontend # Код приложения Frontend
└── sausage-store-chart # Чарты для деплоя
├── Chart.yaml
├── charts
│   ├── backend # Чарт приложения Backend
│   │   ├── Chart.yaml
│   │   └── templates
│   ├── backend-report # Чарт Backend report
│   │   ├── Chart.yaml
│   │   └── templates
│   ├── frontend # Чарт приложения Frontend
│   │   └── templates
│   └── infra # Чарт инфраструктурных приложений
│       ├── Chart.yaml
│       └── templates
└── values.yaml
```

## Краткое описание:
- Проект использует GitHub Actions, сервер Valut, все важные данные удалены из кода
- Реализована сборка всех необходимых образов Docker и загрузка их в DockerHub, используются теги
- Добавлены Flyway-миграции
- Во все чарты внесены необходимые корректировки, в том числе описаны манифесты для `PostgreSQL`, используется `PVC`.
- Добавлены `VPA` и `HPA` для backend и backend-report соответственно, они корректно настроены и работают.
- Используется `LivenessProbe` для backend, backend-report.
- Автоматизировано создание пользователей для DB.
- Чарт проходит линтер `helm lint ./sausage-store-chart`, полностью готов к работе, включает `frontend`, `backend`, `backend-report` и `infra`, успешно разворачивается в Kubernetes кластере, загружается в Nexus.
## Настройка проекта

### Настройка Github Actions Secrets
Установите следующие secrets: 
- `DOCKER_USER`, `DOCKER_PASSWORD` - ваши данные Docker
- `KUBE_CONFIG`, `KUBE_NAMESPACE` - данные Kubernetes
- `VAULT_HOST`, `VAULT_TOKEN` - данные вашего сервера Vault
- `NEXUS_HELM_REPO`, `NEXUS_HELM_REPO_USER`, `NEXUS_HELM_REPO_PASSWORD`, `NEXUS_REPO_NAME` - данные Nexus

### Настройка Vault
Добавьте следующие данные, они будут загружаться автоматически
- Добавьте `spring.datasource.username`, `spring.datasource.password`, `spring.datasource.url` для PostgreSQL
- Добавьте `spring.data.mongodb.uri` для MongoDB

## Полезные команды

Посмотреть pods, статусы
```
kubectl -n <namespace> get po
```

Проверить логи
```
kubectl -n <namespace> logs <pod>
```

Посмотреть все ресурсы
```
kubectl -n <namespace> get all
```

## Technologies used in original sausage store

* Frontend – TypeScript, Angular.
* Backend  – Java 16, Spring Boot, Spring Data.
* Database – H2.

## Installation guide of original shop
### Backend

Install Java 16 and maven and run:

```bash
cd backend
mvn package
cd target
java -jar sausage-store-0.0.1-SNAPSHOT.jar
```

### Frontend

Install NodeJS and npm on your computer and run:

```bash
cd frontend
npm install
npm run build
npm install -g http-server
sudo http-server ./dist/frontend/ -p 80 --proxy http://localhost:8080
```

Then open your browser and go to [http://localhost](http://localhost)


### Спасибо, что посмотрели мой проект!
Если есть вопросы или рекомендации - буду рад ответить в Telegram - @orionisman
