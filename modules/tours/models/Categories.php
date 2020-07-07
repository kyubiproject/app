<?php
namespace tours\models;

use kyubi\base\ActiveRecord;

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
   
 *
 * Relations:
 * @property RCategories[] $rCategories
 * @property Tours[] $tours
 */
class Categories extends ActiveRecord
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

    /**
     * Gets query for [[RCategories]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRCategories()
    {
        return $this->hasMany(RCategories::className(), ['tours_categories_id' => 'id']);
    }

    /**
     * Gets query for [[RCategories]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasMany(RCategories::className(), ['tours_categories_id' => 'id']);
    }
}