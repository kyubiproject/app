<?php
namespace tours\models;

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
			[['tours_id', 'adults', 'date', 'time'], 'required'],
			[['id', 'tours_id', 'adults', 'children'], 'is', 'type' => 'int'],
			[['children'], 'default', 'value' => 0],
			[['date'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['time'], 'date', 'type' => 'time', 'format' => 'hh:mm:ss'],
			[['hotel_name'], 'string', 'max' => 100],
			[['hotel_room'], 'string', 'max' => 45],
			[['tours_id'], 'exist', 'targetClass' => Tours::className(), 'targetAttribute' => ['tours_id' => 'id']]        
        ];
    }
}