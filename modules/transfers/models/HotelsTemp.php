<?php
namespace transfers\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "transfers_hotels_temp".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $description  
* @property integer|null $zone_id  
* @property string|null $date_added  
   
 *
 * Relations:
 * @property Zones $zones
 */
class HotelsTemp extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'transfers_hotels_temp';
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
			[['id', 'zone_id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 100],
			[['date_added'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['date_added'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['zone_id'], 'exist', 'targetClass' => Zones::className(), 'targetAttribute' => ['zone_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Zones]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getZones()
    {
        return $this->hasOne(Zones::className(), ['id' => 'zone_id']);
    }
}