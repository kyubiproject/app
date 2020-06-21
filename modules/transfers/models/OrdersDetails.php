<?php
namespace transfers\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "transfers_orders_details".
 *
 * Columns:
* @property integer $id  
* @property integer $type_id  
* @property integer $hotel_id  
* @property integer $service_id  
* @property integer $adults  
* @property integer|null $children  
* @property string $arrival_date  
* @property string $arrival_time  
* @property string $arrival_airline  
* @property string $arrival_flight  
* @property string|null $departure_date  
* @property string|null $departure_time  
* @property string|null $departure_airline  
* @property string|null $departure_flight  
   
 *
 * Relations:
 * @property \transfers\models\Hotels $hotels
 * @property \transfers\models\Services $services
 * @property \transfers\models\Types $types
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
        return 'transfers_orders_details';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['type_id','hotel_id','service_id','arrival_date','arrival_time','arrival_airline','arrival_flight'], 'required'],
			[['id','type_id','hotel_id','service_id','adults','children'], 'is', 'type' => "int"],
			[['adults','children'], 'default', 'value' => 0],
			[['arrival_date','departure_date'], 'type', 'type' => "date",'dateFormat' => "yyyy-mm-dd"],
			[['arrival_time','departure_time'], 'type', 'type' => "time",'dateFormat' => "hh:mm:ss"],
			[['arrival_airline','arrival_flight','departure_airline','departure_flight'], 'string', 'max' => 100],
			[['id'], 'unique'],
			[['hotel_id'], 'exist', 'targetClass' => \transfers\models\Hotels::className(),'targetAttribute' => ['hotel_id' => id]],
			[['type_id'], 'exist', 'targetClass' => \transfers\models\Types::className(),'targetAttribute' => ['type_id' => id]],
			[['service_id'], 'exist', 'targetClass' => \transfers\models\Services::className(),'targetAttribute' => ['service_id' => id]]        
        ];
    }

    /**
     * Gets query for [[transfers\models\Hotels]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getHotels()
    {
        return $this->hasOne(\transfers\models\Hotels::className(), ['id' => 'hotel_id']);
    }

    /**
     * Gets query for [[transfers\models\Services]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getServices()
    {
        return $this->hasOne(\transfers\models\Services::className(), ['id' => 'service_id']);
    }

    /**
     * Gets query for [[transfers\models\Types]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTypes()
    {
        return $this->hasOne(\transfers\models\Types::className(), ['id' => 'type_id']);
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