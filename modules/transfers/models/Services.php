<?php
namespace transfers\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "transfers_services".
 *
 * Columns:
* @property integer $id  
* @property boolean|null $enabled  
* @property string $name  
* @property string|null $description  
* @property double|null $price  
* @property string $code  
* @property string|null $image  
* @property integer|null $weight  
   
 *
 * Relations:
 * @property \cart\models\CouponsTransfers[] $couponsTransfers
 * @property \transfers\models\OrdersDetails[] $ordersDetails
 * @property \transfers\models\Prices[] $prices
 */
class Services extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'transfers_services';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name','code'], 'required'],
			[['id','weight'], 'is', 'type' => "int"],
			[['price'], 'is', 'type' => "double",'size' => "10, 2"],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['price','weight'], 'default', 'value' => 0],
			[['name'], 'string', 'max' => 100],
			[['code'], 'string', 'max' => 45],
			[['image'], 'string', 'max' => 255]        
        ];
    }

    /**
     * Gets query for [[cart\models\CouponsTransfers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCouponsTransfers()
    {
        return $this->hasMany(\cart\models\CouponsTransfers::className(), ['service_id' => 'id']);
    }

    /**
     * Gets query for [[transfers\models\OrdersDetails]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdersDetails()
    {
        return $this->hasMany(\transfers\models\OrdersDetails::className(), ['service_id' => 'id']);
    }

    /**
     * Gets query for [[transfers\models\Prices]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPrices()
    {
        return $this->hasMany(\transfers\models\Prices::className(), ['service_id' => 'id']);
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