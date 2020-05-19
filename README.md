#INSTALACION
- PHP 7.x
	- extension: php_yaml
- MySQL 5.7 or higher

#INSTALACION

composer create-project --prefer-dist kyubi/app
- solicitar configurar BD

composer create-project --prefer-dist kyubi/backend
composer create-project --prefer-dist kyubi/studio


**Cambiar forma de escribir comandos**
vendor/bin/yii <command> --appconfig=app/config/main.php
`php yii ...` o `yii ...`

**Crear comando para configurar BD**
`yii config:bd -driver=mysql -host=localhost -dbname=logalty_stats -(u)sername=root -(p)assword=root -alias`
