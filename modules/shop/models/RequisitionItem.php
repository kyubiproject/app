<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_requisition_item".
 *
 * Columns:
* @property integer $id  
* @property integer $shop_requisition__id {"rules":["uniqueMix"]} 
* @property integer $shop_item__id {"rules":["uniqueMix"]} 
* @property double $quantity  
   
 *
 * Relations:
 * @property \shop\models\Item $item
 * @property \shop\models\Requisition $requisition
 */
class RequisitionItem extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'shop_requisition_item';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['shop_requisition__id','shop_item__id','quantity'], 'required'],
			[['id','shop_requisition__id','shop_item__id'], 'is', 'type' => 'int'],
			[['quantity'], 'is', 'type' => 'decimal', 'size' => '19, 0'],
			[{'{\'targetAttribute\':[\'shop_requisition__id\',\'shop_item__id\']}':'quantity'}, 'unique'],
			[['shop_item__id'], 'exist', 'targetClass' => \shop\models\Item::className(), 'targetAttribute' => ['shop_item__id' => 'id']],
			[['shop_requisition__id'], 'exist', 'targetClass' => \shop\models\Requisition::className(), 'targetAttribute' => ['shop_requisition__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[shop\models\Item]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItem()
    {
        return $this->hasOne(\shop\models\Item::className(), ['id' => 'shop_item__id']);
    }

    /**
     * Gets query for [[shop\models\Requisition]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequisition()
    {
        return $this->hasOne(\shop\models\Requisition::className(), ['id' => 'shop_requisition__id']);
    }
}