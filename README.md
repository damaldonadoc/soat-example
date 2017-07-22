# SOAT

## Requerimientos

* Ruby 2.4.1
* Rails 5.1.2
* PostgreSQL 9.x

## Instalación (ambiente local)

Clonar el proyecto:
```
git clone  https://github.com/damaldonadoc/soat-example.git
```

Crear la base de datos:
```
rails db:create
```

Ejecutar migraciones:
```
rails db:migrate
```

Poblar base de datos:
```
rails db:seed
```

Configurar variables de entorno, editar archivo 'config/application.yml' de
acuedo con el siguiente ejemplo:
```
development:
  SMTP_SERVER: smtp.email.com
  SMTP_LOGIN: su.email@email.com
  SMTP_PASSWORD: password
  SMTPMAILGUN_PORT: 25
  ADMIN_USER: admin_user
  ADMIN_PASSWORD: admin_password
```

Ejecutar servidor:
```
rails server
```

## Admin

La aplicación dispone de un panel administrador en la ruta '/admin', las
credenciales de autenticación deben ser establecidas en el archivo
'config/application.yml'.
