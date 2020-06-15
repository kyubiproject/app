<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_delivery".
 *
 * Columns:
* @property integer $id  
* @property string $tracking_number  
* @property string $company  
* @property string $shipping_date  
* @property string|null $delivery_date  
* @property string|null $note  
* @property integer $created_by  
* @property string $created_at  
   
 *
 * Relations:
 * @property \shop\models\OrderDelivery[] $orderDeliveries
 * @property \shop\models\Order[] $orders
 */
class Delivery extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'shop_delivery';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['tracking_number','company','shipping_date','created_by'], 'required'],
			[['id','created_by'], 'is', 'type' => 'int'],
			[['tracking_number'], 'string', 'max' => 20],
			[['company'], 'string', 'max' => 100],
			[['note'], 'string', 'max' => 500],
			[['shipping_date','delivery_date'], 'type', 'type' => 'date', 'dateFormat' => 'yyyy-mm-dd'],
			[['created_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]]        
        ];
    }

    /**
     * Gets query for [[shop\models\OrderDelivery]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderDeliveries()
    {
        return $this->hasMany(\shop\models\OrderDelivery::className(), ['shop_delivery__id' => 'id']);
    }

    /**
     * Gets query for [[shop\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\shop\models\Order::className(), ['id' => 'shop_order__id'])->via('orderDeliveries');
    }
}