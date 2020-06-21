<?php
namespace tours\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "tours_orders_details".
 *
 * Columns:
* @property integer $id  
* @property integer $tours_id  
* @property integer $adults  
* @property integer|null $children  
* @property string $date  
* @property string $time  
* @property string|null $hotel_name  
* @property string|null $hotel_room  
   
 *
 * Relations:
 * @property \tours\models\Tours $tours
 */
class OrdersDetails extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_orders_details';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tours_id','adults','date','time'], 'required'],
			[['id','tours_id','adults','children'], 'is', 'type' => "int"],
			[['children'], 'default', 'value' => 0],
			[['date'], 'type', 'type' => "date",'dateFormat' => "yyyy-mm-dd"],
			[['time'], 'type', 'type' => "time",'dateFormat' => "hh:mm:ss"],
			[['hotel_name'], 'string', 'max' => 100],
			[['hotel_room'], 'string', 'max' => 45],
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