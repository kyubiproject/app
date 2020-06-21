<?php
namespace common\models;

use kyubi\base\orm\ActiveRecord ;

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
 * @property \common\models\Regions[] $regions
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
			[['name','FIPS104','ISO2','ISO3','ISON'], 'required'],
			[['id','areacode'], 'is', 'type' => "int"],
			[['name'], 'string', 'max' => 100],
			[['FIPS104','ISO2','ISO3','ISON'], 'string', 'max' => 5],
			[['areacode'], 'default', 'value' => 0],
			[['id'], 'unique']        
        ];
    }

    /**
     * Gets query for [[common\models\Regions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRegions()
    {
        return $this->hasMany(\common\models\Regions::className(), ['country_id' => 'id']);
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