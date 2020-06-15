<?php
namespace rbac\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rbac_group".
 *
 * Columns:
* @property integer $id  
* @property string $name {"rules":["unique"]} 
* @property string|null $note  
* @property boolean $is_active {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
* @property integer $created_by  
* @property string $created_at  
* @property string $updated_at  
   
 *
 * Relations:
 * @property \rbac\models\GroupAction[] $groupActions
 * @property \rbac\models\GroupUser[] $groupUsers
 * @property \rbac\models\User[] $users
 */
class Group extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rbac_group';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name','is_active','created_by'], 'required'],
			[['id','created_by'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 50],
			[['note'], 'string', 'max' => 500],
			[['is_active'], 'boolean'],
			[['created_at','updated_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['updated_at'], 'default', 'value' => '0000-00-00 00:00:00'],
			[['name'], 'unique']        
        ];
    }

    /**
     * Gets query for [[rbac\models\GroupAction]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGroupActions()
    {
        return $this->hasMany(\rbac\models\GroupAction::className(), ['rbac_group__id' => 'id']);
    }

    /**
     * Gets query for [[rbac\models\GroupUser]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGroupUsers()
    {
        return $this->hasMany(\rbac\models\GroupUser::className(), ['rbac_group__id' => 'id']);
    }

    /**
     * Gets query for [[rbac\models\User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(\rbac\models\User::className(), ['id' => 'rbac_user__id'])->via('groupUsers');
    }
}