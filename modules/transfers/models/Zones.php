<?php
namespace transfers\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "transfers_zones".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property boolean|null $enabled  
* @property string|null $photo  
* @property double|null $price  
* @property integer $common_regions_id  
   
 *
 * Relations:
 * @property \cart\models\CouponsTransfers[] $couponsTransfers
 * @property \transfers\models\Hotels[] $hotels
 * @property \transfers\models\HotelsTemp[] $hotelsTemps
 * @property \transfers\models\Prices[] $prices
 * @property \common\models\Regions $regions
 */
class Zones extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'transfers_zones';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name','common_regions_id'], 'required'],
			[['id','common_regions_id'], 'is', 'type' => "int"],
			[['price'], 'is', 'type' => "double",'size' => "10, 2"],
			[['name'], 'string', 'max' => 45],
			[['photo'], 'string', 'max' => 250],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['price'], 'default', 'value' => 0],
			[['id'], 'unique'],
			[['common_regions_id'], 'exist', 'targetClass' => \common\models\Regions::className(),'targetAttribute' => ['common_regions_id' => id]]        
        ];
    }

    /**
     * Gets query for [[cart\models\CouponsTransfers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCouponsTransfers()
    {
        return $this->hasMany(\cart\models\CouponsTransfers::className(), ['zone_id' => 'id']);
    }

    /**
     * Gets query for [[transfers\models\Hotels]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getHotels()
    {
        return $this->hasMany(\transfers\models\Hotels::className(), ['zone_id' => 'id']);
    }

    /**
     * Gets query for [[transfers\models\HotelsTemp]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getHotelsTemps()
    {
        return $this->hasMany(\transfers\models\HotelsTemp::className(), ['zone_id' => 'id']);
    }

    /**
     * Gets query for [[transfers\models\Prices]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPrices()
    {
        return $this->hasMany(\transfers\models\Prices::className(), ['zone_id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Regions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRegions()
    {
        return $this->hasOne(\common\models\Regions::className(), ['id' => 'common_regions_id']);
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