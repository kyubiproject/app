<?php
namespace rbac\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rbac_user".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string $username {"rules":["unique"]} 
* @property string $password  
* @property string|null $security_question  
* @property string|null $security_answer  
* @property boolean $is_active {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
* @property string|null $last_login to  
* @property integer $created_by  
* @property string $created_at  
* @property string $updated_at  
   
 *
 * Relations:
 * @property \rrhh\models\Employee[] $employees
 * @property \rbac\models\GroupUser[] $groupUsers
 * @property \rbac\models\Group[] $groups
 */
class User extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rbac_user';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name','username','password','is_active','created_by'], 'required'],
			[['id','created_by'], 'is', 'type' => 'int'],
			[['name','security_question'], 'string', 'max' => 100],
			[['username'], 'string', 'max' => 30],
			[['password','security_answer'], 'string', 'max' => 72],
			[['is_active'], 'boolean'],
			[['last_login to','created_at','updated_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['last_login to','updated_at'], 'default', 'value' => '0000-00-00 00:00:00'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['username'], 'unique']        
        ];
    }

    /**
     * Gets query for [[rrhh\models\Employee]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEmployees()
    {
        return $this->hasMany(\rrhh\models\Employee::className(), ['rbac_user__id' => 'id']);
    }

    /**
     * Gets query for [[rbac\models\GroupUser]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGroupUsers()
    {
        return $this->hasMany(\rbac\models\GroupUser::className(), ['rbac_user__id' => 'id']);
    }

    /**
     * Gets query for [[rbac\models\Group]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGroups()
    {
        return $this->hasMany(\rbac\models\Group::className(), ['id' => 'rbac_group__id'])->via('groupUsers');
    }
}