<?php
namespace backend\models\base;

/**
 * This is the model class for table "backend__profile".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property boolean $is_active  
 */
class Profile extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'backend__profile';
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
			[['name'], 'string', 'max' => 100],
			[['is_active'], 'boolean'],
			[['is_active'], 'default', 'value' => 1]        
        ];
    }
}