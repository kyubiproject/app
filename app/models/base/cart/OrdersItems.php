<?php
namespace app\models\base\cart;

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
			[['sku'], 'string', 'max' => 50],
			[['product'], 'string', 'max' => 200],
			[['module'], 'string', 'max' => 45],
			[['cart_order_id'], 'exist', 'targetClass' => Orders::className(), 'targetAttribute' => ['cart_order_id' => 'id']],
			[['provider_id'], 'exist', 'targetClass' => \app\models\base\common\Providers::className(), 'targetAttribute' => ['provider_id' => 'id']]        
        ];
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