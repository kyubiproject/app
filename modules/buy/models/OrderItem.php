<?php
namespace buy\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "buy__order_item".
 *
 * Columns:
* @property integer $id  
* @property integer $buy__order__id  
* @property string $name  
* @property float $qty  
* @property float|null $tax  
* @property double|null $price  
   
 *
 * Relations:
 * @property \buy\models\Order $order
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
        return 'buy__order_item';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['buy__order__id','name','qty'], 'required'],
			[['id','buy__order__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['qty','tax'], 'is', 'type' => "float",'size' => "7, 2"],
			[['price'], 'is', 'type' => "double",'size' => "15, 2"],
			[['name'], 'string', 'max' => 128],
			[['buy__order__id'], 'exist', 'targetClass' => \buy\models\Order::className(),'targetAttribute' => ['buy__order__id' => id]]        
        ];
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
}