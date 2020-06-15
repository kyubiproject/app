<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_item".
 *
 * Columns:
* @property integer $id  
* @property string|null $code {"rules":["unique"]} 
* @property string $name  
* @property string|null $unit  
* @property integer|null $shop_item_category__id  
* @property boolean $is_active {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
   
 *
 * Relations:
 * @property \shop\models\ItemCategory $itemCategory
 * @property \shop\models\OrderItem[] $orderItems
 * @property \shop\models\RequisitionItem[] $requisitionItems
 */
class Item extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'shop_item';
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
			[['id','shop_item_category__id'], 'is', 'type' => 'int'],
			[['code','unit'], 'string', 'max' => 10],
			[['name'], 'string', 'max' => 255],
			[['is_active'], 'boolean'],
			[['code'], 'unique'],
			[['shop_item_category__id'], 'exist', 'targetClass' => \shop\models\ItemCategory::className(), 'targetAttribute' => ['shop_item_category__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[shop\models\ItemCategory]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItemCategory()
    {
        return $this->hasOne(\shop\models\ItemCategory::className(), ['id' => 'shop_item_category__id']);
    }

    /**
     * Gets query for [[shop\models\OrderItem]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderItems()
    {
        return $this->hasMany(\shop\models\OrderItem::className(), ['shop_item__id' => 'id']);
    }

    /**
     * Gets query for [[shop\models\RequisitionItem]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequisitionItems()
    {
        return $this->hasMany(\shop\models\RequisitionItem::className(), ['shop_item__id' => 'id']);
    }
}