<?php
namespace tours\models;

/**
 * This is the model class for table "tours_categories".
 *
 * Columns:
* @property integer $id  
* @property boolean $enabled  
* @property string $name  
* @property string|null $description  
* @property string|null $image  
* @property integer $parent_category  
 */
class Categories extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_categories';
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
			[['id', 'parent_category'], 'is', 'type' => 'int'],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['parent_category'], 'default', 'value' => 0],
			[['name'], 'string', 'max' => 100],
			[['description', 'image'], 'string', 'max' => 255]        
        ];
    }
}