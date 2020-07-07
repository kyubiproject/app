<?php
namespace common\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "common_countries".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string $FIPS104  
* @property string $ISO2  
* @property string $ISO3  
* @property string $ISON  
* @property integer $areacode  
   
 *
 * Relations:
 * @property Regions[] $regions
 */
class Countries extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_countries';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name', 'FIPS104', 'ISO2', 'ISO3', 'ISON'], 'required'],
			[['id', 'areacode'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 100],
			[['FIPS104', 'ISO2', 'ISO3', 'ISON'], 'string', 'max' => 5],
			[['areacode'], 'default', 'value' => 0],
			[['id'], 'unique']        
        ];
    }

    /**
     * Gets query for [[Regions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRegions()
    {
        return $this->hasMany(Regions::className(), ['country_id' => 'id']);
    }
}