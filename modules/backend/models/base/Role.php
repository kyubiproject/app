<?php
namespace backend\models\base;

/**
 * This is the model class for table "backend__role".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property boolean $is_active  
 */
class Role extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'backend__role';
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
			[['name'], 'string', 'max' => 60],
			[['is_active'], 'boolean'],
			[['is_active'], 'default', 'value' => 1],
			[['name'], 'unique']        
        ];
    }
}