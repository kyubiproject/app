<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_item_category".
 *
 * Columns:
* @property integer $id  
* @property string $name {"rules":["unique"]} 
   
 *
 * Relations:
 * @property \shop\models\Item[] $items
 */
class ItemCategory extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'shop_item_category';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 100],
			[['name'], 'unique']        
        ];
    }

    /**
     * Gets query for [[shop\models\Item]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(\shop\models\Item::className(), ['shop_item_category__id' => 'id']);
    }
}