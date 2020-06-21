<?php
namespace cart\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "cart_clients".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string $email  
* @property string|null $address  
* @property string|null $phone  
* @property string $last_ip  
* @property string $last_browseruseragent  
* @property string $language_id  
* @property integer|null $region_id  
   
 *
 * Relations:
 * @property \cart\models\Orders[] $orders
 * @property \common\models\Regions $regions
 */
class Clients extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_clients';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name','email','last_ip','last_browseruseragent','language_id'], 'required'],
			[['id','region_id'], 'is', 'type' => "int"],
			[['name','email'], 'string', 'max' => 100],
			[['address','last_browseruseragent'], 'string', 'max' => 255],
			[['phone','last_ip'], 'string', 'max' => 45],
			[['language_id'], 'string', 'max' => 5],
			[['id'], 'unique'],
			[['region_id'], 'exist', 'targetClass' => \common\models\Regions::className(),'targetAttribute' => ['region_id' => id]]        
        ];
    }

    /**
     * Gets query for [[cart\models\Orders]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\cart\models\Orders::className(), ['clients_id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Regions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRegions()
    {
        return $this->hasOne(\common\models\Regions::className(), ['id' => 'region_id']);
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