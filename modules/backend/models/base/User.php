<?php
namespace backend\models\base;

/**
 * This is the model class for table "backend__user".
 *
 * Columns:
* @property integer $id  
* @property string $username  
* @property string $group  
* @property string|null $name  
* @property string|null $email  
* @property string|null $password  
* @property string|null $token  
* @property array $status  
 */
class User extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'backend__user';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['username', 'group'], 'required'],
			[['username'], 'string', 'max' => 15],
			[['name'], 'string', 'max' => 120],
			[['email'], 'string', 'max' => 90],
			[['password'], 'string', 'max' => 60],
			[['token'], 'string', 'max' => 36],
			[['status'], 'default', 'value' => 'ACTIVE'],
			[['email', 'username'], 'unique']        
        ];
    }
}