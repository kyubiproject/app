<?php
namespace tours\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "tours_dates_status".
 *
 * Columns:
* @property integer $id  
* @property string $name  
   
 *
 * Relations:
 * @property Dates[] $dates
 */
class DatesStatus extends ActiveRecord
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

    /**
     * Gets query for [[Dates]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDates()
    {
        return $this->hasMany(Dates::className(), ['status_id' => 'id']);
    }
}