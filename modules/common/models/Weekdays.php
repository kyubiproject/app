<?php
namespace common\models;

/**
 * This is the model class for table "common_weekdays".
 *
 * Columns:
* @property integer $id  
* @property string $name  
 */
class Weekdays extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_weekdays';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'name'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 45]        
        ];
    }
}