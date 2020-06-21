<?php
namespace buy\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "buy__order".
 *
 * Columns:
* @property integer $id  
* @property string $type  
* @property string|null $status  
* @property integer|null $buy__order__id  
* @property integer|null $buy__provider__id  
* @property integer|null $bexe__moment__id  
   
 *
 * Relations:
 * @property \buy\models\Invoice $invoice
 * @property \bexe\models\Moment $moment
 * @property \buy\models\Order $order
 * @property \buy\models\OrderDocument $orderDocument
 * @property \buy\models\OrderItem[] $orderItems
 * @property \buy\models\Order[] $orders
 * @property \buy\models\Provider $provider
 * @property \buy\models\Quote $quote
 * @property \buy\models\Request $request
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
        return 'buy__order';
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
			[['id','buy__order__id','buy__provider__id','bexe__moment__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['type'], 'range', 'range' => ['REQUEST', 'INVOICE', 'QUOTE'],'strict' => true],
			[['status'], 'range', 'range' => ['LOCK', 'CANCEL', 'CLOSE'],'strict' => true],
			[['buy__order__id'], 'exist', 'targetClass' => \buy\models\Order::className(),'targetAttribute' => ['buy__order__id' => id]],
			[['bexe__moment__id'], 'exist', 'targetClass' => \bexe\models\Moment::className(),'targetAttribute' => ['bexe__moment__id' => id]],
			[['buy__provider__id'], 'exist', 'targetClass' => \buy\models\Provider::className(),'targetAttribute' => ['buy__provider__id' => id]]        
        ];
    }

    /**
     * Gets query for [[buy\models\Invoice]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getInvoice()
    {
        return $this->hasOne(\buy\models\Invoice::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bexe\models\Moment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoment()
    {
        return $this->hasOne(\bexe\models\Moment::className(), ['id' => 'bexe__moment__id']);
    }

    /**
     * Gets query for [[buy\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrder()
    {
        return $this->hasOne(\buy\models\Order::className(), ['id' => 'buy__order__id']);
    }

    /**
     * Gets query for [[buy\models\OrderDocument]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderDocument()
    {
        return $this->hasOne(\buy\models\OrderDocument::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[buy\models\OrderItem]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderItems()
    {
        return $this->hasMany(\buy\models\OrderItem::className(), ['buy__order__id' => 'id']);
    }

    /**
     * Gets query for [[buy\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\buy\models\Order::className(), ['buy__order__id' => 'id']);
    }

    /**
     * Gets query for [[buy\models\Provider]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProvider()
    {
        return $this->hasOne(\buy\models\Provider::className(), ['id' => 'buy__provider__id']);
    }

    /**
     * Gets query for [[buy\models\Quote]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getQuote()
    {
        return $this->hasOne(\buy\models\Quote::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[buy\models\Request]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequest()
    {
        return $this->hasOne(\buy\models\Request::className(), ['id' => 'id']);
    }
}