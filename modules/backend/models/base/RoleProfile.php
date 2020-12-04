<?php
namespace backend\models\base;

/**
 * This is the model class for table "backend__role_profile".
 *
 * Columns:
* @property integer $profile__id  
* @property integer $role__id  
 */
class RoleProfile extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'backend__role_profile';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['profile__id', 'role__id'], 'required'],
			[['role__id', 'profile__id'], 'unique', 'targetAttribute' => ['role__id', 'profile__id']],
			[['profile__id'], 'exist', 'targetClass' => Profile::className(), 'targetAttribute' => ['profile__id' => 'id']],
			[['role__id'], 'exist', 'targetClass' => Role::className(), 'targetAttribute' => ['role__id' => 'id']]        
        ];
    }
}