#REQUIREMENTS
- PHP 7.x or higher
- extension: php_yaml
- MySQL 5.7 or higher

#INSTALL

composer create-project --prefer-dist kyubi/app `app_name`

$ cd app_name

$ php kyubi config/requirements

$ php kyubi config/key [base]

- base: string (defaults to '')
  Base to generate the secure key.

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
