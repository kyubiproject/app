<?php
namespace common\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "common_providers".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $address  
* @property string|null $phone  
* @property string|null $fax  
* @property string|null $email  
* @property boolean|null $enabled  
* @property integer|null $weight  
* @property string|null $image  
* @property integer|null $cart_gateways_id  
* @property string|null $bank_account  
* @property string|null $description  
   
 *
 * Relations:
 * @property \common\models\Contacts[] $contacts
 * @property \cart\models\Gateways $gateways
 * @property \cart\models\OrdersItems[] $ordersItems
 * @property \transfers\models\Prices[] $prices
 * @property \transfers\models\Providers[] $providers
 * @property \tours\models\Tours[] $tours
 */
class Providers extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_providers';
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
			[['id','weight','cart_gateways_id'], 'is', 'type' => "int"],
			[['name'], 'string', 'max' => 200],
			[['address','image','bank_account'], 'string', 'max' => 255],
			[['phone','fax','email'], 'string', 'max' => 100],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['cart_gateways_id'], 'exist', 'targetClass' => \cart\models\Gateways::className(),'targetAttribute' => ['cart_gateways_id' => id]]        
        ];
    }

    /**
     * Gets query for [[common\models\Contacts]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getContacts()
    {
        return $this->hasMany(\common\models\Contacts::className(), ['provider_id' => 'id']);
    }

    /**
     * Gets query for [[cart\models\Gateways]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGateways()
    {
        return $this->hasOne(\cart\models\Gateways::className(), ['id' => 'cart_gateways_id']);
    }

    /**
     * Gets query for [[cart\models\OrdersItems]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdersItems()
    {
        return $this->hasMany(\cart\models\OrdersItems::className(), ['provider_id' => 'id']);
    }

    /**
     * Gets query for [[transfers\models\Prices]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPrices()
    {
        return $this->hasMany(\transfers\models\Prices::className(), ['provider_id' => 'id']);
    }

    /**
     * Gets query for [[transfers\models\Providers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProviders()
    {
        return $this->hasMany(\transfers\models\Providers::className(), ['provider_id' => 'id']);
    }

    /**
     * Gets query for [[tours\models\Tours]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasMany(\tours\models\Tours::className(), ['providers_id' => 'id']);
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