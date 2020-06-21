<?php
namespace base\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "base__role".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $note  
* @property boolean|null $is_active  
   
 *
 * Relations:
 * @property \base\models\Permission[] $permissions
 * @property \base\models\UserRole[] $userRoles
 * @property \base\models\User[] $users
 */
class Role extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'base__role';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name'], 'required'],
			[['id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['name'], 'string', 'max' => 32],
			[['is_active'], 'boolean'],
			[['is_active'], 'default', 'value' => 1],
			[['name'], 'unique']        
        ];
    }

    /**
     * Gets query for [[base\models\Permission]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPermissions()
    {
        return $this->hasMany(\base\models\Permission::className(), ['base__role__id' => 'id']);
    }

    /**
     * Gets query for [[base\models\UserRole]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUserRoles()
    {
        return $this->hasMany(\base\models\UserRole::className(), ['base__role__id' => 'id']);
    }

    /**
     * Gets query for [[base\models\User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(\base\models\User::className(), ['id' => 'base__user__id'])->via('userRoles');
    }
}