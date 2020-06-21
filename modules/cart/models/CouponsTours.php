<?php
namespace cart\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "cart_coupons_tours".
 *
 * Columns:
* @property integer $id  
* @property integer $coupon_id  
* @property integer|null $tour_id  
* @property double|null $discount_adults  
* @property double|null $discount_children  
* @property string $type  
 */
class CouponsTours extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_coupons_tours';
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
			[['id','coupon_id','tour_id'], 'is', 'type' => "int"],
			[['discount_adults','discount_children'], 'is', 'type' => "decimal",'size' => "10, 2"],
			[['type'], 'string', 'max' => 1]        
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