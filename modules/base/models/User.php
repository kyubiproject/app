<?php
namespace base\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "base__user".
 *
 * Columns:
* @property integer $id  
* @property string|null $name  
* @property string $username  
* @property string|null $email  
* @property string $type  
* @property string|null $password  
* @property string|null $token  
* @property string|null $token_expire  
* @property boolean|null $is_active  
   
 *
 * Relations:
 * @property \base\models\Role[] $roles
 * @property \base\models\UserActivity[] $userActivities
 * @property \base\models\UserRole[] $userRoles
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
        return 'base__user';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['username','type'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['name'], 'string', 'max' => 128],
			[['username'], 'string', 'max' => 16],
			[['email'], 'string', 'max' => 96],
			[['password','token'], 'string', 'max' => 75],
			[['type'], 'range', 'range' => ['ADMIN', 'USER', 'ROOT'],'strict' => true],
			[['token_expire'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['is_active'], 'boolean'],
			[['is_active'], 'default', 'value' => 1],
			[['email','username'], 'unique']        
        ];
    }

    /**
     * Gets query for [[base\models\Role]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRoles()
    {
        return $this->hasMany(\base\models\Role::className(), ['id' => 'base__role__id'])->via('userRoles');
    }

    /**
     * Gets query for [[base\models\UserActivity]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUserActivities()
    {
        return $this->hasMany(\base\models\UserActivity::className(), ['base__user__id' => 'id']);
    }

    /**
     * Gets query for [[base\models\UserRole]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUserRoles()
    {
        return $this->hasMany(\base\models\UserRole::className(), ['base__user__id' => 'id']);
    }
}