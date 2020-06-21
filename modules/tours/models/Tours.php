<?php
namespace tours\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "tours".
 *
 * Columns:
* @property integer $id  
* @property boolean|null $enabled  
* @property string $name  
* @property string|null $subtitle  
* @property string|null $introduction  
* @property string $description  
* @property double $price_adults  
* @property double|null $price_children  
* @property string|null $price_provider  
* @property integer|null $children_min_age  
* @property integer|null $children_max_age  
* @property integer|null $adults_min_age  
* @property integer|null $adults_max_age  
* @property string|null $pickup_details  
* @property string|null $terms_and_conditions  
* @property integer $providers_id  
* @property integer $regions_id  
* @property integer $currencies_id  
   
 *
 * Relations:
 * @property \tours\models\Categories[] $categories
 * @property \cart\models\Currencies $currencies
 * @property \tours\models\Dates[] $dates
 * @property \tours\models\Includes[] $includes
 * @property \tours\models\IncludesTypes[] $includesTypes
 * @property \tours\models\OrdersDetails[] $ordersDetails
 * @property \tours\models\Photos[] $photos
 * @property \tours\models\PricesOverride[] $pricesOverrides
 * @property \common\models\Providers $providers
 * @property \tours\models\RCategories[] $rCategories
 * @property \tours\models\RIncludes[] $rIncludes
 * @property \common\models\Regions $regions
 * @property \tours\models\Times[] $times
 * @property \tours\models\Videos[] $videos
 */
class Tours extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name','description','price_adults','providers_id','regions_id','currencies_id'], 'required'],
			[['id','children_min_age','children_max_age','adults_min_age','adults_max_age','providers_id','regions_id','currencies_id'], 'is', 'type' => "int"],
			[['price_adults','price_children'], 'is', 'type' => "double",'size' => "10, 2"],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['name','subtitle'], 'string', 'max' => 100],
			[['introduction'], 'string', 'max' => 300],
			[['price_provider'], 'string', 'max' => 11],
			[['currencies_id'], 'exist', 'targetClass' => \cart\models\Currencies::className(),'targetAttribute' => ['currencies_id' => id]],
			[['providers_id'], 'exist', 'targetClass' => \common\models\Providers::className(),'targetAttribute' => ['providers_id' => id]],
			[['regions_id'], 'exist', 'targetClass' => \common\models\Regions::className(),'targetAttribute' => ['regions_id' => id]]        
        ];
    }

    /**
     * Gets query for [[tours\models\Categories]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategories()
    {
        return $this->hasMany(\tours\models\Categories::className(), ['id' => 'tours_categories_id'])->via('rCategories');
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
     * Gets query for [[tours\models\Dates]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDates()
    {
        return $this->hasMany(\tours\models\Dates::className(), ['tour_id' => 'id']);
    }

    /**
     * Gets query for [[tours\models\Includes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIncludes()
    {
        return $this->hasMany(\tours\models\Includes::className(), ['id' => 'tours_includes_id'])->via('rIncludes');
    }

    /**
     * Gets query for [[tours\models\IncludesTypes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIncludesTypes()
    {
        return $this->hasMany(\tours\models\IncludesTypes::className(), ['id' => 'tours_includes_types_id'])->via('rIncludes');
    }

    /**
     * Gets query for [[tours\models\OrdersDetails]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdersDetails()
    {
        return $this->hasMany(\tours\models\OrdersDetails::className(), ['tours_id' => 'id']);
    }

    /**
     * Gets query for [[tours\models\Photos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPhotos()
    {
        return $this->hasMany(\tours\models\Photos::className(), ['tours_id' => 'id']);
    }

    /**
     * Gets query for [[tours\models\PricesOverride]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPricesOverrides()
    {
        return $this->hasMany(\tours\models\PricesOverride::className(), ['tours_id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Providers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProviders()
    {
        return $this->hasOne(\common\models\Providers::className(), ['id' => 'providers_id']);
    }

    /**
     * Gets query for [[tours\models\RCategories]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRCategories()
    {
        return $this->hasMany(\tours\models\RCategories::className(), ['tours_id' => 'id']);
    }

    /**
     * Gets query for [[tours\models\RIncludes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRIncludes()
    {
        return $this->hasMany(\tours\models\RIncludes::className(), ['tours_id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Regions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRegions()
    {
        return $this->hasOne(\common\models\Regions::className(), ['id' => 'regions_id']);
    }

    /**
     * Gets query for [[tours\models\Times]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTimes()
    {
        return $this->hasMany(\tours\models\Times::className(), ['tours_id' => 'id']);
    }

    /**
     * Gets query for [[tours\models\Videos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVideos()
    {
        return $this->hasMany(\tours\models\Videos::className(), ['tours_id' => 'id']);
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