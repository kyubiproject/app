<?php
namespace tours\models;

/**
 * This is the model class for table "tours_includes".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $description  
* @property string|null $image  
 */
class Includes extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_includes';
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
			[['id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 100],
			[['description', 'image'], 'string', 'max' => 255]        
        ];
    }
}