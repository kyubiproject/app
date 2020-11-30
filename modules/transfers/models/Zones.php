<?php
namespace transfers\models;

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
 */
class Zones extends \kyubi\base\ActiveRecord
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
}