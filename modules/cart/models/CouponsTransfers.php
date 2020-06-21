<?php
namespace cart\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "cart_coupons_transfers".
 *
 * Columns:
* @property integer $id  
* @property integer $coupon_id  
* @property integer|null $service_id  
* @property integer|null $type_id  
* @property integer|null $hotel_id  
* @property integer|null $zone_id  
* @property double|null $discount_adults  
* @property double|null $discount_children  
* @property string $type  
   
 *
 * Relations:
 * @property \cart\models\Coupons $coupons
 * @property \transfers\models\Hotels $hotels
 * @property \transfers\models\Services $services
 * @property \transfers\models\Types $types
 * @property \transfers\models\Zones $zones
 */
class CouponsTransfers extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_coupons_transfers';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['coupon_id','type'], 'required'],
			[['id','coupon_id','service_id','type_id','hotel_id','zone_id'], 'is', 'type' => "int"],
			[['discount_adults','discount_children'], 'is', 'type' => "decimal",'size' => "10, 2"],
			[['type'], 'string', 'max' => 1],
			[['coupon_id'], 'exist', 'targetClass' => \cart\models\Coupons::className(),'targetAttribute' => ['coupon_id' => id]],
			[['hotel_id'], 'exist', 'targetClass' => \transfers\models\Hotels::className(),'targetAttribute' => ['hotel_id' => id]],
			[['service_id'], 'exist', 'targetClass' => \transfers\models\Services::className(),'targetAttribute' => ['service_id' => id]],
			[['type_id'], 'exist', 'targetClass' => \transfers\models\Types::className(),'targetAttribute' => ['type_id' => id]],
			[['zone_id'], 'exist', 'targetClass' => \transfers\models\Zones::className(),'targetAttribute' => ['zone_id' => id]]        
        ];
    }

    /**
     * Gets query for [[cart\models\Coupons]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCoupons()
    {
        return $this->hasOne(\cart\models\Coupons::className(), ['id' => 'coupon_id']);
    }

    /**
     * Gets query for [[transfers\models\Hotels]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getHotels()
    {
        return $this->hasOne(\transfers\models\Hotels::className(), ['id' => 'hotel_id']);
    }

    /**
     * Gets query for [[transfers\models\Services]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getServices()
    {
        return $this->hasOne(\transfers\models\Services::className(), ['id' => 'service_id']);
    }

    /**
     * Gets query for [[transfers\models\Types]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTypes()
    {
        return $this->hasOne(\transfers\models\Types::className(), ['id' => 'type_id']);
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