<?php
namespace tours\models;

/**
 * This is the model class for table "tours_dates_status".
 *
 * Columns:
* @property integer $id  
* @property string $name  
 */
class DatesStatus extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_dates_status';
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
			[['id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 45]        
        ];
    }
}