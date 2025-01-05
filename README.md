# Webdav

Команда запуска

```bash
docker run -it --rm  -p 8080:8080  -v <your_data>:/var/www/localhost/htdocs ghcr.io/linuxoid69/webdav:latest
```

Переменные окружения

```bash
WEBDAV_USERNAME=admin     - имя пользователя для доступа к webdav
WEBDAV_PASSWORD=1234      - пароль
WEBDAV_SYMLINK_ENABLE=yes - если нужно что бы nginx обрабатывал symlink
WEBDAV_PORT=8080          - порт
```
