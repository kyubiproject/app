<?php
namespace transfers\models;

use kyubi\base\ActiveRecord;

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
 * @property Hotels[] $hotels
 * @property HotelsTemp[] $hotelsTemps
 * @property Prices[] $prices
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
			[['name', 'common_regions_id'], 'required'],
			[['id', 'common_regions_id'], 'is', 'type' => 'int'],
			[['price'], 'is', 'type' => 'double', 'size' => '10, 2'],
			[['name'], 'string', 'max' => 45],
			[['photo'], 'string', 'max' => 250],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['price'], 'default', 'value' => 0],
			[['id'], 'unique'],
			[['common_regions_id'], 'exist', 'targetClass' => \common\models\Regions::className(), 'targetAttribute' => ['common_regions_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\cart\models\CouponsTransfers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCouponsTransfers()
    {
        return $this->hasMany(\cart\models\CouponsTransfers::className(), ['zone_id' => 'id']);
    }

    /**
     * Gets query for [[Hotels]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getHotels()
    {
        return $this->hasMany(Hotels::className(), ['zone_id' => 'id']);
    }

    /**
     * Gets query for [[HotelsTemp]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getHotelsTemps()
    {
        return $this->hasMany(HotelsTemp::className(), ['zone_id' => 'id']);
    }

    /**
     * Gets query for [[Prices]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPrices()
    {
        return $this->hasMany(Prices::className(), ['zone_id' => 'id']);
    }

    /**
     * Gets query for [[Prices]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRegions()
    {
        return $this->hasMany(Prices::className(), ['zone_id' => 'id']);
    }
}