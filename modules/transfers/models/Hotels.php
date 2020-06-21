<?php
namespace transfers\models;

use kyubi\base\orm\ActiveRecord ;

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
   
 *
 * Relations:
 * @property \cart\models\CouponsTransfers[] $couponsTransfers
 * @property \transfers\models\OrdersDetails[] $ordersDetails
 * @property \transfers\models\Zones $zones
 */
class Hotels extends ActiveRecord 
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
			[['name','zone_id'], 'required'],
			[['id','zone_id'], 'is', 'type' => "int"],
			[['price'], 'is', 'type' => "double",'size' => "10, 2"],
			[['name'], 'string', 'max' => 100],
			[['photo'], 'string', 'max' => 250],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['price'], 'default', 'value' => 0],
			[['id'], 'unique'],
			[['zone_id'], 'exist', 'targetClass' => \transfers\models\Zones::className(),'targetAttribute' => ['zone_id' => id]]        
        ];
    }

    /**
     * Gets query for [[cart\models\CouponsTransfers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCouponsTransfers()
    {
        return $this->hasMany(\cart\models\CouponsTransfers::className(), ['hotel_id' => 'id']);
    }

    /**
     * Gets query for [[transfers\models\OrdersDetails]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdersDetails()
    {
        return $this->hasMany(\transfers\models\OrdersDetails::className(), ['hotel_id' => 'id']);
    }

    /**
     * Gets query for [[transfers\models\Zones]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getZones()
    {
        return $this->hasOne(\transfers\models\Zones::className(), ['id' => 'zone_id']);
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