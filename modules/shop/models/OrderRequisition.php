<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_order_requisition".
 *
 * Columns:
* @property integer $shop_order__id  
* @property integer $shop_requisition__id  
   
 *
 * Relations:
 * @property \shop\models\Order $order
 * @property \shop\models\Requisition $requisition
 */
class OrderRequisition extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'shop_order_requisition';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['shop_order__id','shop_requisition__id'], 'required'],
			[['shop_order__id','shop_requisition__id'], 'is', 'type' => 'int'],
			[{'{\'targetAttribute\':[\'shop_order__id\',\'shop_requisition__id\']}':'shop_requisition__id'}, 'unique'],
			[['shop_order__id'], 'exist', 'targetClass' => \shop\models\Order::className(), 'targetAttribute' => ['shop_order__id' => 'id']],
			[['shop_requisition__id'], 'exist', 'targetClass' => \shop\models\Requisition::className(), 'targetAttribute' => ['shop_requisition__id' => 'id']]        
        ];
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

    /**
     * Gets query for [[shop\models\Requisition]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequisition()
    {
        return $this->hasOne(\shop\models\Requisition::className(), ['id' => 'shop_requisition__id']);
    }
}