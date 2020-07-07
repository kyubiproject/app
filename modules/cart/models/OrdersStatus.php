<?php
namespace cart\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "cart_orders_status".
 *
 * Columns:
* @property integer $id  
* @property string $status  
* @property string|null $description  
   
 *
 * Relations:
 * @property Orders[] $orders
 */
class OrdersStatus extends ActiveRecord
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
			[['id'], 'is', 'type' => 'int'],
			[['status'], 'string', 'max' => 45]        
        ];
    }

    /**
     * Gets query for [[Orders]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(Orders::className(), ['orders_status_id' => 'id']);
    }
}