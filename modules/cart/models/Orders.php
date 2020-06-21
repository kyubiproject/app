<?php
namespace cart\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "cart_orders".
 *
 * Columns:
* @property integer $id  
* @property string|null $order_date  
* @property double $amount_total  
* @property double $amount_subtotal  
* @property integer $currencies_id  
* @property integer|null $orders_status_id  
* @property integer $gateways_id  
* @property string|null $gateways_transaction_id  
* @property integer $clients_id  
* @property integer|null $cart_coupons_id  
* @property string|null $comments  
* @property double|null $refound_amount  
   
 *
 * Relations:
 * @property \cart\models\Clients $clients
 * @property \cart\models\Coupons $coupons
 * @property \cart\models\Currencies $currencies
 * @property \cart\models\Gateways $gateways
 * @property \cart\models\OrdersItems[] $ordersItems
 * @property \cart\models\OrdersStatus $ordersStatus
 */
class Orders extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_orders';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['amount_total','amount_subtotal','currencies_id','gateways_id','clients_id'], 'required'],
			[['id','currencies_id','orders_status_id','gateways_id','clients_id','cart_coupons_id'], 'is', 'type' => "int"],
			[['amount_total','amount_subtotal','refound_amount'], 'is', 'type' => "double",'size' => "10, 2"],
			[['order_date'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['order_date'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
			[['orders_status_id'], 'default', 'value' => 1],
			[['refound_amount'], 'default', 'value' => 0],
			[['gateways_transaction_id'], 'string', 'max' => 100],
			[['cart_coupons_id'], 'exist', 'targetClass' => \cart\models\Coupons::className(),'targetAttribute' => ['cart_coupons_id' => id]],
			[['clients_id'], 'exist', 'targetClass' => \cart\models\Clients::className(),'targetAttribute' => ['clients_id' => id]],
			[['currencies_id'], 'exist', 'targetClass' => \cart\models\Currencies::className(),'targetAttribute' => ['currencies_id' => id]],
			[['gateways_id'], 'exist', 'targetClass' => \cart\models\Gateways::className(),'targetAttribute' => ['gateways_id' => id]],
			[['orders_status_id'], 'exist', 'targetClass' => \cart\models\OrdersStatus::className(),'targetAttribute' => ['orders_status_id' => id]]        
        ];
    }

    /**
     * Gets query for [[cart\models\Clients]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getClients()
    {
        return $this->hasOne(\cart\models\Clients::className(), ['id' => 'clients_id']);
    }

    /**
     * Gets query for [[cart\models\Coupons]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCoupons()
    {
        return $this->hasOne(\cart\models\Coupons::className(), ['id' => 'cart_coupons_id']);
    }

    /**
     * Gets query for [[cart\models\Currencies]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCurrencies()
    {
        return $this->hasOne(\cart\models\Currencies::className(), ['id' => 'currencies_id']);
    }

    /**
     * Gets query for [[cart\models\Gateways]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGateways()
    {
        return $this->hasOne(\cart\models\Gateways::className(), ['id' => 'gateways_id']);
    }

    /**
     * Gets query for [[cart\models\OrdersItems]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdersItems()
    {
        return $this->hasMany(\cart\models\OrdersItems::className(), ['cart_order_id' => 'id']);
    }

    /**
     * Gets query for [[cart\models\OrdersStatus]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdersStatus()
    {
        return $this->hasOne(\cart\models\OrdersStatus::className(), ['id' => 'orders_status_id']);
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