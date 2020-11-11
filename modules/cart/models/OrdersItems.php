<?php
namespace cart\models;

/**
 * This is the model class for table "cart_orders_items".
 *
 * Columns:
* @property integer $id  
* @property string $sku  
* @property string $product  
* @property double $amount  
* @property integer $provider_id  
* @property integer $cart_order_id  
* @property string|null $comments  
* @property string $module  
 */
class OrdersItems extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_orders_items';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['sku', 'product', 'amount', 'provider_id', 'cart_order_id', 'module'], 'required'],
			[['id', 'provider_id', 'cart_order_id'], 'is', 'type' => 'int'],
			[['amount'], 'is', 'type' => 'double', 'size' => '10, 2'],
			[['sku'], 'string', 'max' => 50],
			[['product'], 'string', 'max' => 200],
			[['module'], 'string', 'max' => 45],
			[['cart_order_id'], 'exist', 'targetClass' => Orders::className(), 'targetAttribute' => ['cart_order_id' => 'id']],
			[['provider_id'], 'exist', 'targetClass' => \common\models\Providers::className(), 'targetAttribute' => ['provider_id' => 'id']]        
        ];
    }
}