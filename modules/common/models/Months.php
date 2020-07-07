<?php
namespace common\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "common_months".
 *
 * Columns:
* @property integer $id  
* @property string $name  
   
 *
 * Relations:
 * @property \tours\models\Dates[] $dates
 */
class Months extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_months';
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

    /**
     * Gets query for [[\tours\models\Dates]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDates()
    {
        return $this->hasMany(\tours\models\Dates::className(), ['month_id' => 'id']);
    }
}