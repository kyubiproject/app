<?php
namespace cart\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "cart_coupons".
 *
 * Columns:
* @property integer $id  
* @property boolean|null $enabled  
* @property string $code  
* @property string $name  
* @property string|null $description  
* @property double $discount_cart  
* @property string $type  
* @property string $start_date  
* @property string|null $end_date  
* @property integer|null $uses_max  
* @property integer|null $uses_count  
* @property string|null $created  
   
 *
 * Relations:
 * @property \cart\models\CouponsTransfers[] $couponsTransfers
 * @property \cart\models\Orders[] $orders
 */
class Coupons extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_coupons';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['code','name','discount_cart','type','start_date'], 'required'],
			[['id','uses_max','uses_count'], 'is', 'type' => "int"],
			[['discount_cart'], 'is', 'type' => "decimal",'size' => "10, 2"],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['uses_max','uses_count'], 'default', 'value' => 0],
			[['created'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
			[['code'], 'string', 'max' => 20],
			[['name'], 'string', 'max' => 100],
			[['type'], 'string', 'max' => 1],
			[['start_date','end_date','created'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"]        
        ];
    }

    /**
     * Gets query for [[cart\models\CouponsTransfers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCouponsTransfers()
    {
        return $this->hasMany(\cart\models\CouponsTransfers::className(), ['coupon_id' => 'id']);
    }

    /**
     * Gets query for [[cart\models\Orders]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\cart\models\Orders::className(), ['cart_coupons_id' => 'id']);
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