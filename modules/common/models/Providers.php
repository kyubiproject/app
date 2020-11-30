<?php
namespace common\models;

/**
 * This is the model class for table "common_providers".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $address  
* @property string|null $phone  
* @property string|null $fax  
* @property string|null $email  
* @property boolean|null $enabled  
* @property integer|null $weight  
* @property string|null $image  
* @property integer|null $cart_gateways_id  
* @property string|null $bank_account  
* @property string|null $description  
 */
class Providers extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_providers';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name'], 'required'],
			[['id', 'weight', 'cart_gateways_id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 200],
			[['address', 'image', 'bank_account'], 'string', 'max' => 255],
			[['phone', 'fax', 'email'], 'string', 'max' => 100],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['cart_gateways_id'], 'exist', 'targetClass' => \cart\models\Gateways::className(), 'targetAttribute' => ['cart_gateways_id' => 'id']]        
        ];
    }
}