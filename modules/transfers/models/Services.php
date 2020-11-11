<?php
namespace transfers\models;

/**
 * This is the model class for table "transfers_services".
 *
 * Columns:
* @property integer $id  
* @property boolean|null $enabled  
* @property string $name  
* @property string|null $description  
* @property double|null $price  
* @property string $code  
* @property string|null $image  
* @property integer|null $weight  
 */
class Services extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'transfers_services';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name', 'code'], 'required'],
			[['id', 'weight'], 'is', 'type' => 'int'],
			[['price'], 'is', 'type' => 'double', 'size' => '10, 2'],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['price', 'weight'], 'default', 'value' => 0],
			[['name'], 'string', 'max' => 100],
			[['code'], 'string', 'max' => 45],
			[['image'], 'string', 'max' => 255]        
        ];
    }
}