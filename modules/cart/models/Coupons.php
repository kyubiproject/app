<?php
namespace cart\models;

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
 */
class Coupons extends \kyubi\base\ActiveRecord
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
			[['code', 'name', 'discount_cart', 'type', 'start_date'], 'required'],
			[['id', 'uses_max', 'uses_count'], 'is', 'type' => 'int'],
			[['discount_cart'], 'is', 'type' => 'decimal', 'size' => '10, 2'],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['uses_max', 'uses_count'], 'default', 'value' => 0],
			[['created'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['code'], 'string', 'max' => 20],
			[['name'], 'string', 'max' => 100],
			[['type'], 'string', 'max' => 1],
			[['start_date', 'end_date', 'created'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss']        
        ];
    }
}