<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__order".
 *
 * Columns:
* @property integer $id  
* @property string|null $note  
* @property string $type  
* @property string|null $status  
* @property integer|null $sale__order__id  
* @property integer|null $sale__client__id  
   
 *
 * Relations:
 * @property \sale\models\Client $client
 * @property \sale\models\Invoice $invoice
 * @property \sale\models\Order $order
 * @property \sale\models\OrderItem[] $orderItems
 * @property \sale\models\Order[] $orders
 * @property \sale\models\Quote $quote
 * @property \sale\models\Request $request
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
        return 'sale__order';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['type'], 'required'],
			[['id','sale__order__id','sale__client__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['type'], 'range', 'range' => ['REQUEST', 'INVOICE', 'QUOTE'],'strict' => true],
			[['status'], 'range', 'range' => ['LOCK', 'CANCEL', 'COMPLETE'],'strict' => true],
			[['sale__order__id'], 'exist', 'targetClass' => \sale\models\Order::className(),'targetAttribute' => ['sale__order__id' => id]],
			[['sale__client__id'], 'exist', 'targetClass' => \sale\models\Client::className(),'targetAttribute' => ['sale__client__id' => id]]        
        ];
    }

    /**
     * Gets query for [[sale\models\Client]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getClient()
    {
        return $this->hasOne(\sale\models\Client::className(), ['id' => 'sale__client__id']);
    }

    /**
     * Gets query for [[sale\models\Invoice]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getInvoice()
    {
        return $this->hasOne(\sale\models\Invoice::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[sale\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrder()
    {
        return $this->hasOne(\sale\models\Order::className(), ['id' => 'sale__order__id']);
    }

    /**
     * Gets query for [[sale\models\OrderItem]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderItems()
    {
        return $this->hasMany(\sale\models\OrderItem::className(), ['sale__order__id' => 'id']);
    }

    /**
     * Gets query for [[sale\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\sale\models\Order::className(), ['sale__order__id' => 'id']);
    }

    /**
     * Gets query for [[sale\models\Quote]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getQuote()
    {
        return $this->hasOne(\sale\models\Quote::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[sale\models\Request]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequest()
    {
        return $this->hasOne(\sale\models\Request::className(), ['id' => 'id']);
    }
}