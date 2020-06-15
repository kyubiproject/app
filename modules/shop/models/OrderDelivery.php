<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_order_delivery".
 *
 * Columns:
* @property integer $shop_order__id  
* @property integer $shop_delivery__id  
   
 *
 * Relations:
 * @property \shop\models\Delivery $delivery
 * @property \shop\models\Order $order
 */
class OrderDelivery extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'shop_order_delivery';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['shop_order__id','shop_delivery__id'], 'required'],
			[['shop_order__id','shop_delivery__id'], 'is', 'type' => 'int'],
			[{'{\'targetAttribute\':[\'shop_delivery__id\',\'shop_order__id\']}':'shop_delivery__id'}, 'unique'],
			[['shop_delivery__id'], 'exist', 'targetClass' => \shop\models\Delivery::className(), 'targetAttribute' => ['shop_delivery__id' => 'id']],
			[['shop_order__id'], 'exist', 'targetClass' => \shop\models\Order::className(), 'targetAttribute' => ['shop_order__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[shop\models\Delivery]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDelivery()
    {
        return $this->hasOne(\shop\models\Delivery::className(), ['id' => 'shop_delivery__id']);
    }

    /**
     * Gets query for [[shop\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrder()
    {
        return $this->hasOne(\shop\models\Order::className(), ['id' => 'shop_order__id']);
    }
}