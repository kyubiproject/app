<?php
namespace transfers\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "transfers_types".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property boolean|null $enabled  
* @property string|null $description  
* @property string|null $photo  
* @property double|null $price  
* @property integer|null $weight  
   
 *
 * Relations:
 * @property \cart\models\CouponsTransfers[] $couponsTransfers
 * @property OrdersDetails[] $ordersDetails
 * @property Prices[] $prices
 */
class Types extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'transfers_types';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name'], 'required'],
			[['id', 'weight'], 'is', 'type' => 'int'],
			[['price'], 'is', 'type' => 'double', 'size' => '10, 2'],
			[['name'], 'string', 'max' => 45],
			[['photo'], 'string', 'max' => 250],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['price', 'weight'], 'default', 'value' => 0]        
        ];
    }

    /**
     * Gets query for [[\cart\models\CouponsTransfers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCouponsTransfers()
    {
        return $this->hasMany(\cart\models\CouponsTransfers::className(), ['type_id' => 'id']);
    }

    /**
     * Gets query for [[OrdersDetails]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdersDetails()
    {
        return $this->hasMany(OrdersDetails::className(), ['type_id' => 'id']);
    }

    /**
     * Gets query for [[OrdersDetails]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPrices()
    {
        return $this->hasMany(OrdersDetails::className(), ['type_id' => 'id']);
    }
}