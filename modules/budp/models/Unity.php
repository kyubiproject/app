<?php
namespace budp\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "budp_unity".
 *
 * Columns:
* @property integer $id  
* @property string $name {"rules":["unique"]} 
* @property string|null $responsible  
* @property boolean $is_active {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
   
 *
 * Relations:
 * @property \budp\models\Category[] $categories
 * @property \budp\models\CategoryUnity[] $categoryUnities
 */
class Unity extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'budp_unity';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name','is_active'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['name','responsible'], 'string', 'max' => 100],
			[['is_active'], 'boolean'],
			[['name'], 'unique']        
        ];
    }

    /**
     * Gets query for [[budp\models\Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategories()
    {
        return $this->hasMany(\budp\models\Category::className(), ['id' => 'budp_category__id'])->via('categoryUnities');
    }

    /**
     * Gets query for [[budp\models\CategoryUnity]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategoryUnities()
    {
        return $this->hasMany(\budp\models\CategoryUnity::className(), ['budp_unity__id' => 'id']);
    }
}