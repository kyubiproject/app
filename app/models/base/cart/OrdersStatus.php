<?php
namespace app\models\base\cart;

/**
 * This is the model class for table "cart_orders_status".
 *
 * Columns:
* @property integer $id  
* @property string $status  
* @property string|null $description  
 */
class OrdersStatus extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_orders_status';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['status'], 'required'],
			[['status'], 'string', 'max' => 45]        
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