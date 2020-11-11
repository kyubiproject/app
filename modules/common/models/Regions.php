<?php
namespace common\models;

/**
 * This is the model class for table "common_regions".
 *
 * Columns:
* @property integer $id  
* @property integer $country_id  
* @property string $name  
* @property string $code  
* @property string $adm1code  
 */
class Regions extends \kyubi\base\ActiveRecord
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
}