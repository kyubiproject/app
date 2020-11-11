<?php
namespace tours\models;

/**
 * This is the model class for table "tours_prices_override".
 *
 * Columns:
* @property integer $id  
* @property integer $tours_id  
* @property string $date  
* @property double $price_adults  
* @property double|null $price_children  
* @property integer $cart_currencies_id  
 */
class PricesOverride extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_prices_override';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tours_id', 'date', 'price_adults', 'cart_currencies_id'], 'required'],
			[['id', 'tours_id', 'cart_currencies_id'], 'is', 'type' => 'int'],
			[['price_adults', 'price_children'], 'is', 'type' => 'double', 'size' => '10, 2'],
			[['date'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['tours_id'], 'exist', 'targetClass' => Tours::className(), 'targetAttribute' => ['tours_id' => 'id']],
			[['cart_currencies_id'], 'exist', 'targetClass' => \cart\models\Currencies::className(), 'targetAttribute' => ['cart_currencies_id' => 'id']]        
        ];
    }
}