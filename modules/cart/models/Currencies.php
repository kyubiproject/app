<?php
namespace cart\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "cart_currencies".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string $code  
* @property boolean|null $enabled  
* @property double|null $conversion  
* @property integer|null $weight  
   
 *
 * Relations:
 * @property \cart\models\Gateways $gateways
 * @property \cart\models\Orders[] $orders
 * @property \cart\models\Partners[] $partners
 * @property \transfers\models\Prices[] $prices
 * @property \tours\models\PricesOverride[] $pricesOverrides
 * @property \tours\models\Tours[] $tours
 */
class Currencies extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_currencies';
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
			[['conversion'], 'is', 'type' => "double",'size' => "10, 2"],
			[['name'], 'string', 'max' => 100],
			[['code'], 'string', 'max' => 10],
			[['enabled'], 'boolean'],
			[['enabled','conversion'], 'default', 'value' => 1],
			[['weight'], 'default', 'value' => 0]        
        ];
    }

    /**
     * Gets query for [[cart\models\Gateways]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGateways()
    {
        return $this->hasOne(\cart\models\Gateways::className(), ['currencies_id' => 'id']);
    }

    /**
     * Gets query for [[cart\models\Orders]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\cart\models\Orders::className(), ['currencies_id' => 'id']);
    }

    /**
     * Gets query for [[cart\models\Partners]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPartners()
    {
        return $this->hasMany(\cart\models\Partners::className(), ['currencies_id' => 'id']);
    }

    /**
     * Gets query for [[transfers\models\Prices]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPrices()
    {
        return $this->hasMany(\transfers\models\Prices::className(), ['currency_id' => 'id']);
    }

    /**
     * Gets query for [[tours\models\PricesOverride]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPricesOverrides()
    {
        return $this->hasMany(\tours\models\PricesOverride::className(), ['cart_currencies_id' => 'id']);
    }

    /**
     * Gets query for [[tours\models\Tours]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasMany(\tours\models\Tours::className(), ['currencies_id' => 'id']);
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