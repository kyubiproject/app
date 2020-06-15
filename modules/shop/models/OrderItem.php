<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_order_item".
 *
 * Columns:
* @property integer $id  
* @property integer $shop_order__id {"rules":["uniqueMix"]} 
* @property integer $shop_item__id {"rules":["uniqueMix"]} 
* @property double $quantity  
* @property double $unit_price  
   
 *
 * Relations:
 * @property \shop\models\Item $item
 * @property \shop\models\Order $order
 */
class OrderItem extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'shop_order_item';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['shop_order__id','shop_item__id','quantity','unit_price'], 'required'],
			[['id','shop_order__id','shop_item__id'], 'is', 'type' => 'int'],
			[['quantity','unit_price'], 'is', 'type' => 'decimal', 'size' => '19, 0'],
			[['shop_item__id'], 'exist', 'targetClass' => \shop\models\Item::className(), 'targetAttribute' => ['shop_item__id' => 'id']],
			[['shop_order__id'], 'exist', 'targetClass' => \shop\models\Order::className(), 'targetAttribute' => ['shop_order__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[shop\models\Item]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItem()
    {
        return $this->hasOne(\shop\models\Item::className(), ['id' => 'shop_item__id']);
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