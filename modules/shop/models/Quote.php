<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_quote".
 *
 * Columns:
* @property integer $id  
* @property string $quote_number  
* @property string $quote_date  
* @property string|null $expiration_date  
   
 *
 * Relations:
 * @property \shop\models\Order $order
 */
class Quote extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'shop_quote';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','quote_number','quote_date'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['quote_number'], 'string', 'max' => 10],
			[['quote_date','expiration_date'], 'type', 'type' => 'date', 'dateFormat' => 'yyyy-mm-dd'],
			[['id'], 'exist', 'targetClass' => \shop\models\Order::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[shop\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrder()
    {
        return $this->hasOne(\shop\models\Order::className(), ['id' => 'id']);
    }
}