<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_order".
 *
 * Columns:
* @property integer $id  
* @property integer $shop_provider__id  
* @property double $tax_rate  
* @property string|null $note  
* @property boolean $is_annulled {"list":{"es":["Correcta","Anulada"],"en":["Correcta","Anulada"]}} 
* @property integer $created_by  
* @property string $created_at  
* @property string|null $closed_at  
   
 *
 * Relations:
 * @property \shop\models\Delivery[] $deliveries
 * @property \shop\models\Invoice $invoice
 * @property \shop\models\OrderDelivery[] $orderDeliveries
 * @property \shop\models\OrderItem[] $orderItems
 * @property \shop\models\OrderRequisition[] $orderRequisitions
 * @property \shop\models\Provider $provider
 * @property \shop\models\Quote $quote
 * @property \shop\models\Requisition[] $requisitions
 */
class Order extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'shop_order';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['shop_provider__id','tax_rate','is_annulled','created_by'], 'required'],
			[['id','shop_provider__id','created_by'], 'is', 'type' => 'int'],
			[['tax_rate'], 'is', 'type' => 'decimal', 'size' => '19, 0'],
			[['note'], 'string', 'max' => 500],
			[['is_annulled'], 'boolean'],
			[['created_at','closed_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['shop_provider__id'], 'exist', 'targetClass' => \shop\models\Provider::className(), 'targetAttribute' => ['shop_provider__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[shop\models\Delivery]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDeliveries()
    {
        return $this->hasMany(\shop\models\Delivery::className(), ['id' => 'shop_delivery__id'])->via('orderDeliveries');
    }

    /**
     * Gets query for [[shop\models\Invoice]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getInvoice()
    {
        return $this->hasOne(\shop\models\Invoice::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[shop\models\OrderDelivery]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderDeliveries()
    {
        return $this->hasMany(\shop\models\OrderDelivery::className(), ['shop_order__id' => 'id']);
    }

    /**
     * Gets query for [[shop\models\OrderItem]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderItems()
    {
        return $this->hasMany(\shop\models\OrderItem::className(), ['shop_order__id' => 'id']);
    }

    /**
     * Gets query for [[shop\models\OrderRequisition]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderRequisitions()
    {
        return $this->hasMany(\shop\models\OrderRequisition::className(), ['shop_order__id' => 'id']);
    }

    /**
     * Gets query for [[shop\models\Provider]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProvider()
    {
        return $this->hasOne(\shop\models\Provider::className(), ['id' => 'shop_provider__id']);
    }

    /**
     * Gets query for [[shop\models\Quote]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getQuote()
    {
        return $this->hasOne(\shop\models\Quote::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[shop\models\Requisition]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequisitions()
    {
        return $this->hasMany(\shop\models\Requisition::className(), ['id' => 'shop_requisition__id'])->via('orderRequisitions');
    }
}