<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__order_item".
 *
 * Columns:
* @property integer $id  
* @property integer $sale__order__id  
* @property integer $sale__item__id  
* @property float $qty  
* @property double|null $price  
* @property double|null $net_price  
* @property string $created_at  
   
 *
 * Relations:
 * @property \sale\models\Item $item
 * @property \sale\models\Order $order
 */
class OrderItem extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'sale__order_item';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['sale__order__id','sale__item__id','qty'], 'required'],
			[['id'], 'is', 'type' => "mediumint",'unsigned' => true],
			[['sale__order__id','sale__item__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['qty'], 'is', 'type' => "float",'size' => "7, 2"],
			[['price','net_price'], 'is', 'type' => "double",'size' => "15, 2"],
			[['created_at'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['created_at'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
			[['sale__order__id'], 'exist', 'targetClass' => \sale\models\Order::className(),'targetAttribute' => ['sale__order__id' => id]],
			[['sale__item__id'], 'exist', 'targetClass' => \sale\models\Item::className(),'targetAttribute' => ['sale__item__id' => id]]        
        ];
    }

    /**
     * Gets query for [[sale\models\Item]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItem()
    {
        return $this->hasOne(\sale\models\Item::className(), ['id' => 'sale__item__id']);
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
}