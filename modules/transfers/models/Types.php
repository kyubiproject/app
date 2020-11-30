<?php
namespace transfers\models;

/**
 * This is the model class for table "transfers_types".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property boolean|null $enabled  
* @property string|null $description  
* @property string|null $photo  
* @property double|null $price  
* @property integer|null $weight  
 */
class Types extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'transfers_types';
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
			[['id', 'weight'], 'is', 'type' => 'int'],
			[['price'], 'is', 'type' => 'double', 'size' => '10, 2'],
			[['name'], 'string', 'max' => 45],
			[['photo'], 'string', 'max' => 250],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['price', 'weight'], 'default', 'value' => 0]        
        ];
    }
}