<?php
namespace common\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "common_weekdays".
 *
 * Columns:
* @property integer $id  
* @property string $name  
   
 *
 * Relations:
 * @property \tours\models\Dates[] $dates
 */
class Weekdays extends ActiveRecord 
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
			[['id','name'], 'required'],
			[['id'], 'is', 'type' => "int"],
			[['name'], 'string', 'max' => 45]        
        ];
    }

    /**
     * Gets query for [[tours\models\Dates]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDates()
    {
        return $this->hasMany(\tours\models\Dates::className(), ['weekday_id' => 'id']);
    }
    
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:getDb()
     */
    public static function getDb()
    {
        return app('viajes');
    }
}