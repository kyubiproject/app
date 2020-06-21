<?php
namespace base\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "base__user_role".
 *
 * Columns:
* @property integer $base__user__id  
* @property integer $base__role__id  
   
 *
 * Relations:
 * @property \base\models\Role $role
 * @property \base\models\User $user
 */
class UserRole extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'base__user_role';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['base__user__id','base__role__id'], 'required'],
			[['base__user__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['base__role__id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[{'{\'targetAttribute\':[\'base__role__id\',\'base__user__id\']}':'base__role__id'}, 'unique'],
			[['base__role__id'], 'exist', 'targetClass' => \base\models\Role::className(),'targetAttribute' => ['base__role__id' => id]],
			[['base__user__id'], 'exist', 'targetClass' => \base\models\User::className(),'targetAttribute' => ['base__user__id' => id]]        
        ];
    }

    /**
     * Gets query for [[base\models\Role]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(\base\models\Role::className(), ['id' => 'base__role__id']);
    }

    /**
     * Gets query for [[base\models\User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(\base\models\User::className(), ['id' => 'base__user__id']);
    }
}