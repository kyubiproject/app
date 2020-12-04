<?php
namespace backend\models\base;

/**
 * This is the model class for table "backend__user_role".
 *
 * Columns:
* @property integer $user__id  
* @property integer $role__id  
 */
class UserRole extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'backend__user_role';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['user__id', 'role__id'], 'required'],
			[['role__id', 'user__id'], 'unique', 'targetAttribute' => ['role__id', 'user__id']],
			[['user__id'], 'exist', 'targetClass' => User::className(), 'targetAttribute' => ['user__id' => 'id']],
			[['role__id'], 'exist', 'targetClass' => Role::className(), 'targetAttribute' => ['role__id' => 'id']]        
        ];
    }
}