<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_invoice".
 *
 * Columns:
* @property integer $id  
* @property string $invoice_number  
* @property string|null $control_number  
* @property string $invoice_date  
   
 *
 * Relations:
 * @property \shop\models\Order $order
 */
class Invoice extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'shop_invoice';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','invoice_number','invoice_date'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['invoice_number','control_number'], 'string', 'max' => 10],
			[['invoice_date'], 'type', 'type' => 'date', 'dateFormat' => 'yyyy-mm-dd'],
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