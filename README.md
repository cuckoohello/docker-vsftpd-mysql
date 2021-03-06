vsftpd with mysql auth

# Limits
* need to create user home directory manually
  * [pam-MySQL](https://github.com/NigelCunningham/pam-MySQL) does not support getpwnam

# Deploy
```yaml
version: '3'
services:
  vsftpd:
    image: hub.infervision.com/tools/vsftp:1.1.0
    container_name: vsftpd
    restart: always
    network_mode: "host"
    environment:
      - MYSQL_USER=user
      - MYSQL_PASSWORD=password
      - MYSQL_HOST=127.0.0.1
      - MYSQL_DATABASE=database
      - MYSQL_TABLE=users
      - MYSQL_USER_COLUMN=name
      - MYSQL_PASSWD_COLUMN=password
      - MYSQL_PASSWD_CRYPT=0
      - LISTEN_PORT=21
      - PASV_ENABLE=YES
      - PASV_ADDRESS=
      - PASV_MIN_PORT=0
      - PASV_MAX_PORT=0
    volumes:
      - /var/ftp:/home
```
