# Webdav

## Usage

```bash
docker run -it --rm  -p 8080:8080  -v <your_data>:/var/www/localhost/htdocs ghcr.io/linuxoid69/webdav:latest
```

Environment variables

```bash
WEBDAV_USERNAME=admin     - username
WEBDAV_PASSWORD=1234      - password
WEBDAV_SYMLINK_ENABLE=yes - enable symlink
WEBDAV_PORT=8080          - port
WEBDAV_SECRET_PATH        - path to secret file (optional)
```
