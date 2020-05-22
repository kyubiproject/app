#REQUIREMENTS
- PHP 7.x or higher
- extension: php_yaml
- MySQL 5.7 or higher

#INSTALL

composer create-project --prefer-dist kyubi/app `app_name`

$ cd app_name

$ php kyubi config/check-requirements

$ php kyubi config/app-key [appkey]
Options:
- appkey, -k: (empty)

$ php kyubi db/config -u=`username` --p=`password`
Options:
-- name, -conn: db
-- class, -c: yii\db\Connection
-- driver, -d: mysql
-- host, -h: localhost
-- port, -p: 3306
-- user, -u: root
-- pass, -p: (empty)

$ php kyubi db/check --conn=`connection_name`
Options:
-- name, -conn: db
