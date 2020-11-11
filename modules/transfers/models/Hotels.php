<?php
namespace transfers\models;

/**
 * This is the model class for table "transfers_hotels".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property boolean|null $enabled  
* @property string|null $photo  
* @property double|null $price  
* @property integer $zone_id  
 */
class Hotels extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'transfers_hotels';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name', 'zone_id'], 'required'],
			[['id', 'zone_id'], 'is', 'type' => 'int'],
			[['price'], 'is', 'type' => 'double', 'size' => '10, 2'],
			[['name'], 'string', 'max' => 100],
			[['photo'], 'string', 'max' => 250],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['price'], 'default', 'value' => 0],
			[['id'], 'unique'],
			[['zone_id'], 'exist', 'targetClass' => Zones::className(), 'targetAttribute' => ['zone_id' => 'id']]        
        ];
    }
}