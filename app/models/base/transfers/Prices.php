<?php
namespace app\models\base\transfers;

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
 */
class Prices extends \kyubi\base\ActiveRecord
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
			[['min_passengers', 'max_passengers', 'price', 'zone_id', 'type_id', 'provider_id', 'service_id', 'currency_id'], 'required'],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['price_regular', 'price_provider'], 'default', 'value' => 0],
			[['id'], 'unique'],
			[['currency_id'], 'exist', 'targetClass' => \app\models\base\cart\Currencies::className(), 'targetAttribute' => ['currency_id' => 'id']],
			[['provider_id'], 'exist', 'targetClass' => \app\models\base\common\Providers::className(), 'targetAttribute' => ['provider_id' => 'id']],
			[['service_id'], 'exist', 'targetClass' => Services::className(), 'targetAttribute' => ['service_id' => 'id']],
			[['type_id'], 'exist', 'targetClass' => Types::className(), 'targetAttribute' => ['type_id' => 'id']],
			[['zone_id'], 'exist', 'targetClass' => Zones::className(), 'targetAttribute' => ['zone_id' => 'id']]        
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