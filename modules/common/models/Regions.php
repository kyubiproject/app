<?php
namespace common\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "common_regions".
 *
 * Columns:
* @property integer $id  
* @property integer $country_id  
* @property string $name  
* @property string $code  
* @property string $adm1code  
   
 *
 * Relations:
 * @property \cart\models\Clients[] $clients
 * @property Countries $countries
 * @property \tours\models\Tours[] $tours
 * @property \transfers\models\Zones[] $zones
 */
class Regions extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_regions';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['country_id', 'name', 'code', 'adm1code'], 'required'],
			[['id', 'country_id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 100],
			[['code', 'adm1code'], 'string', 'max' => 5],
			[['id'], 'unique'],
			[['country_id'], 'exist', 'targetClass' => Countries::className(), 'targetAttribute' => ['country_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\cart\models\Clients]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getClients()
    {
        return $this->hasMany(\cart\models\Clients::className(), ['region_id' => 'id']);
    }

    /**
     * Gets query for [[Countries]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCountries()
    {
        return $this->hasOne(Countries::className(), ['id' => 'country_id']);
    }

    /**
     * Gets query for [[\tours\models\Tours]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasMany(\tours\models\Tours::className(), ['regions_id' => 'id']);
    }

    /**
     * Gets query for [[\tours\models\Tours]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getZones()
    {
        return $this->hasMany(\tours\models\Tours::className(), ['regions_id' => 'id']);
    }
}