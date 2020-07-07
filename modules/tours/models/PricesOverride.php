<?php
namespace tours\models;

use kyubi\base\ActiveRecord;

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
   
 *
 * Relations:
 * @property \cart\models\Currencies $currencies
 * @property Tours $tours
 */
class PricesOverride extends ActiveRecord
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
			[['date'], 'type', 'type' => 'date', 'dateFormat' => 'yyyy-mm-dd'],
			[['tours_id'], 'exist', 'targetClass' => Tours::className(), 'targetAttribute' => ['tours_id' => 'id']],
			[['cart_currencies_id'], 'exist', 'targetClass' => \cart\models\Currencies::className(), 'targetAttribute' => ['cart_currencies_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\cart\models\Currencies]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCurrencies()
    {
        return $this->hasOne(\cart\models\Currencies::className(), ['id' => 'cart_currencies_id']);
    }

    /**
     * Gets query for [[\cart\models\Currencies]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasOne(\cart\models\Currencies::className(), ['id' => 'cart_currencies_id']);
    }
}