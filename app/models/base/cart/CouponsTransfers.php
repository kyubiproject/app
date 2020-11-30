<?php
namespace app\models\base\cart;

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
			[['type'], 'string', 'max' => 1],
			[['coupon_id'], 'exist', 'targetClass' => Coupons::className(), 'targetAttribute' => ['coupon_id' => 'id']],
			[['hotel_id'], 'exist', 'targetClass' => \app\models\base\transfers\Hotels::className(), 'targetAttribute' => ['hotel_id' => 'id']],
			[['service_id'], 'exist', 'targetClass' => \app\models\base\transfers\Services::className(), 'targetAttribute' => ['service_id' => 'id']],
			[['type_id'], 'exist', 'targetClass' => \app\models\base\transfers\Types::className(), 'targetAttribute' => ['type_id' => 'id']],
			[['zone_id'], 'exist', 'targetClass' => \app\models\base\transfers\Zones::className(), 'targetAttribute' => ['zone_id' => 'id']]        
        ];
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