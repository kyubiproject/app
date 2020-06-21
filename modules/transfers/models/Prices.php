<?php
namespace transfers\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "transfers_prices".
 *
 * Columns:
* @property integer $id  
* @property boolean|null $enabled  
* @property integer $min_passengers  
* @property integer $max_passengers  
* @property double $price  
* @property double|null $price_regular  
* @property double|null $price_provider  
* @property integer $zone_id  
* @property integer $type_id  
* @property integer $provider_id  
* @property integer $service_id  
* @property integer $currency_id  
   
 *
 * Relations:
 * @property \cart\models\Currencies $currencies
 * @property \common\models\Providers $providers
 * @property \transfers\models\Services $services
 * @property \transfers\models\Types $types
 * @property \transfers\models\Zones $zones
 */
class Prices extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'transfers_prices';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['min_passengers','max_passengers','price','zone_id','type_id','provider_id','service_id','currency_id'], 'required'],
			[['id','min_passengers','max_passengers','zone_id','type_id','provider_id','service_id','currency_id'], 'is', 'type' => "int"],
			[['price','price_regular','price_provider'], 'is', 'type' => "double",'size' => "10, 2"],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['price_regular','price_provider'], 'default', 'value' => 0],
			[['id'], 'unique'],
			[['currency_id'], 'exist', 'targetClass' => \cart\models\Currencies::className(),'targetAttribute' => ['currency_id' => id]],
			[['provider_id'], 'exist', 'targetClass' => \common\models\Providers::className(),'targetAttribute' => ['provider_id' => id]],
			[['service_id'], 'exist', 'targetClass' => \transfers\models\Services::className(),'targetAttribute' => ['service_id' => id]],
			[['type_id'], 'exist', 'targetClass' => \transfers\models\Types::className(),'targetAttribute' => ['type_id' => id]],
			[['zone_id'], 'exist', 'targetClass' => \transfers\models\Zones::className(),'targetAttribute' => ['zone_id' => id]]        
        ];
    }

    /**
     * Gets query for [[cart\models\Currencies]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCurrencies()
    {
        return $this->hasOne(\cart\models\Currencies::className(), ['id' => 'currency_id']);
    }

    /**
     * Gets query for [[common\models\Providers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProviders()
    {
        return $this->hasOne(\common\models\Providers::className(), ['id' => 'provider_id']);
    }

    /**
     * Gets query for [[transfers\models\Services]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getServices()
    {
        return $this->hasOne(\transfers\models\Services::className(), ['id' => 'service_id']);
    }

    /**
     * Gets query for [[transfers\models\Types]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTypes()
    {
        return $this->hasOne(\transfers\models\Types::className(), ['id' => 'type_id']);
    }

    /**
     * Gets query for [[transfers\models\Zones]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getZones()
    {
        return $this->hasOne(\transfers\models\Zones::className(), ['id' => 'zone_id']);
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