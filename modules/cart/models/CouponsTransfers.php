<?php
namespace cart\models;

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
 */
class CouponsTransfers extends \kyubi\base\ActiveRecord
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
			[['coupon_id', 'type'], 'required'],
			[['id', 'coupon_id', 'service_id', 'type_id', 'hotel_id', 'zone_id'], 'is', 'type' => 'int'],
			[['discount_adults', 'discount_children'], 'is', 'type' => 'decimal', 'size' => '10, 2'],
			[['type'], 'string', 'max' => 1],
			[['coupon_id'], 'exist', 'targetClass' => Coupons::className(), 'targetAttribute' => ['coupon_id' => 'id']],
			[['hotel_id'], 'exist', 'targetClass' => \transfers\models\Hotels::className(), 'targetAttribute' => ['hotel_id' => 'id']],
			[['service_id'], 'exist', 'targetClass' => \transfers\models\Services::className(), 'targetAttribute' => ['service_id' => 'id']],
			[['type_id'], 'exist', 'targetClass' => \transfers\models\Types::className(), 'targetAttribute' => ['type_id' => 'id']],
			[['zone_id'], 'exist', 'targetClass' => \transfers\models\Zones::className(), 'targetAttribute' => ['zone_id' => 'id']]        
        ];
    }
}