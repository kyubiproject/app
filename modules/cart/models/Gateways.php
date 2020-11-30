<?php
namespace cart\models;

/**
 * This is the model class for table "cart_gateways".
 *
 * Columns:
* @property integer $id  
* @property string $code  
* @property string $name  
* @property string|null $description  
* @property string|null $photo  
* @property boolean|null $enabled  
* @property boolean|null $sandbox  
* @property string $account  
* @property integer $currencies_id  
* @property integer|null $weight  
 */
class Gateways extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_gateways';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['code', 'name', 'account', 'currencies_id'], 'required'],
			[['id', 'currencies_id', 'weight'], 'is', 'type' => 'int'],
			[['code'], 'string', 'max' => 10],
			[['name'], 'string', 'max' => 100],
			[['photo'], 'string', 'max' => 250],
			[['account'], 'string', 'max' => 45],
			[['enabled', 'sandbox'], 'boolean'],
			[['enabled', 'sandbox'], 'default', 'value' => 1],
			[['weight'], 'default', 'value' => 0],
			[['currencies_id'], 'unique'],
			[['currencies_id'], 'exist', 'targetClass' => Currencies::className(), 'targetAttribute' => ['currencies_id' => 'id']]        
        ];
    }
}