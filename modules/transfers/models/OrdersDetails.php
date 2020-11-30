<?php
namespace transfers\models;

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
 */
class OrdersDetails extends \kyubi\base\ActiveRecord
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
			[['type_id', 'hotel_id', 'service_id', 'arrival_date', 'arrival_time', 'arrival_airline', 'arrival_flight'], 'required'],
			[['id', 'type_id', 'hotel_id', 'service_id', 'adults', 'children'], 'is', 'type' => 'int'],
			[['adults', 'children'], 'default', 'value' => 0],
			[['arrival_date', 'departure_date'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['arrival_time', 'departure_time'], 'date', 'type' => 'time', 'format' => 'hh:mm:ss'],
			[['arrival_airline', 'arrival_flight', 'departure_airline', 'departure_flight'], 'string', 'max' => 100],
			[['id'], 'unique'],
			[['hotel_id'], 'exist', 'targetClass' => Hotels::className(), 'targetAttribute' => ['hotel_id' => 'id']],
			[['type_id'], 'exist', 'targetClass' => Types::className(), 'targetAttribute' => ['type_id' => 'id']],
			[['service_id'], 'exist', 'targetClass' => Services::className(), 'targetAttribute' => ['service_id' => 'id']]        
        ];
    }
}