<?php
namespace tours\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "tours_times".
 *
 * Columns:
* @property integer $id  
* @property integer $tours_id  
* @property string $time  
   
 *
 * Relations:
 * @property \tours\models\Tours $tours
 */
class Times extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_times';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tours_id','time'], 'required'],
			[['id','tours_id'], 'is', 'type' => "int"],
			[['time'], 'type', 'type' => "time",'dateFormat' => "hh:mm:ss"],
			[['tours_id'], 'exist', 'targetClass' => \tours\models\Tours::className(),'targetAttribute' => ['tours_id' => id]]        
        ];
    }

    /**
     * Gets query for [[tours\models\Tours]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasOne(\tours\models\Tours::className(), ['id' => 'tours_id']);
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