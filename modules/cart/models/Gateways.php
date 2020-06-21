<?php
namespace cart\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "cart_gateways".
 *
 * Columns:
* @property integer $id  
* @property string $code  
* @property string $name  
* @property string|null $description  
* @property string|null $photo  
* @property boolean|null $enabled  
* @property boolean|null $sandbox  
* @property string $account  
* @property integer $currencies_id  
* @property integer|null $weight  
   
 *
 * Relations:
 * @property \cart\models\Currencies $currencies
 * @property \cart\models\Orders[] $orders
 * @property \cart\models\Partners[] $partners
 * @property \common\models\Providers[] $providers
 */
class Gateways extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_gateways';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['code','name','account','currencies_id'], 'required'],
			[['id','currencies_id','weight'], 'is', 'type' => "int"],
			[['code'], 'string', 'max' => 10],
			[['name'], 'string', 'max' => 100],
			[['photo'], 'string', 'max' => 250],
			[['account'], 'string', 'max' => 45],
			[['enabled','sandbox'], 'boolean'],
			[['enabled','sandbox'], 'default', 'value' => 1],
			[['weight'], 'default', 'value' => 0],
			[['currencies_id'], 'unique'],
			[['currencies_id'], 'exist', 'targetClass' => \cart\models\Currencies::className(),'targetAttribute' => ['currencies_id' => id]]        
        ];
    }

    /**
     * Gets query for [[cart\models\Currencies]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCurrencies()
    {
        return $this->hasOne(\cart\models\Currencies::className(), ['id' => 'currencies_id']);
    }

    /**
     * Gets query for [[cart\models\Orders]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\cart\models\Orders::className(), ['gateways_id' => 'id']);
    }

    /**
     * Gets query for [[cart\models\Partners]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPartners()
    {
        return $this->hasMany(\cart\models\Partners::className(), ['gateways_id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Providers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProviders()
    {
        return $this->hasMany(\common\models\Providers::className(), ['cart_gateways_id' => 'id']);
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