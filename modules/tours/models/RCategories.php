<?php
namespace tours\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "tours_r_categories".
 *
 * Columns:
* @property integer $tours_id  
* @property integer $tours_categories_id  
   
 *
 * Relations:
 * @property Categories $categories
 * @property Tours $tours
 */
class RCategories extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_r_categories';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tours_id', 'tours_categories_id'], 'required'],
			[['tours_id', 'tours_categories_id'], 'is', 'type' => 'int'],
			[['tours_id', 'tours_categories_id'], 'unique', 'targetAttribute' => ['tours_id', 'tours_categories_id']],
			[['tours_id'], 'exist', 'targetClass' => Tours::className(), 'targetAttribute' => ['tours_id' => 'id']],
			[['tours_categories_id'], 'exist', 'targetClass' => Categories::className(), 'targetAttribute' => ['tours_categories_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Categories]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategories()
    {
        return $this->hasOne(Categories::className(), ['id' => 'tours_categories_id']);
    }

    /**
     * Gets query for [[Categories]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasOne(Categories::className(), ['id' => 'tours_categories_id']);
    }
}