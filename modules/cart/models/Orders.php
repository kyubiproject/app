<?php
namespace cart\models;

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
 */
class Orders extends \kyubi\base\ActiveRecord
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
			[['amount_total', 'amount_subtotal', 'currencies_id', 'gateways_id', 'clients_id'], 'required'],
			[['id', 'currencies_id', 'orders_status_id', 'gateways_id', 'clients_id', 'cart_coupons_id'], 'is', 'type' => 'int'],
			[['amount_total', 'amount_subtotal', 'refound_amount'], 'is', 'type' => 'double', 'size' => '10, 2'],
			[['order_date'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss'],
			[['order_date'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['orders_status_id'], 'default', 'value' => 1],
			[['refound_amount'], 'default', 'value' => 0],
			[['gateways_transaction_id'], 'string', 'max' => 100],
			[['cart_coupons_id'], 'exist', 'targetClass' => Coupons::className(), 'targetAttribute' => ['cart_coupons_id' => 'id']],
			[['clients_id'], 'exist', 'targetClass' => Clients::className(), 'targetAttribute' => ['clients_id' => 'id']],
			[['currencies_id'], 'exist', 'targetClass' => Currencies::className(), 'targetAttribute' => ['currencies_id' => 'id']],
			[['gateways_id'], 'exist', 'targetClass' => Gateways::className(), 'targetAttribute' => ['gateways_id' => 'id']],
			[['orders_status_id'], 'exist', 'targetClass' => OrdersStatus::className(), 'targetAttribute' => ['orders_status_id' => 'id']]        
        ];
    }
}