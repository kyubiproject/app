<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_requisition".
 *
 * Columns:
* @property integer $id  
* @property string $code {"rules":["unique"]} 
* @property string $required_date  
* @property string $department  
* @property string|null $note  
* @property boolean $is_annulled {"list":{"es":["Correcta","Anulada"],"en":["Correcta","Anulada"]}} 
* @property integer $created_by  
* @property string $created_at  
* @property string|null $closed_at  
   
 *
 * Relations:
 * @property \shop\models\OrderRequisition[] $orderRequisitions
 * @property \shop\models\Order[] $orders
 * @property \shop\models\RequisitionItem[] $requisitionItems
 */
class Requisition extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'shop_requisition';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['code','required_date','department','is_annulled','created_by'], 'required'],
			[['id','created_by'], 'is', 'type' => 'int'],
			[['code'], 'string', 'max' => 6],
			[['department'], 'string', 'max' => 100],
			[['note'], 'string', 'max' => 500],
			[['required_date'], 'type', 'type' => 'date', 'dateFormat' => 'yyyy-mm-dd'],
			[['created_at','closed_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['is_annulled'], 'boolean'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['code'], 'unique']        
        ];
    }

    /**
     * Gets query for [[shop\models\OrderRequisition]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderRequisitions()
    {
        return $this->hasMany(\shop\models\OrderRequisition::className(), ['shop_requisition__id' => 'id']);
    }

    /**
     * Gets query for [[shop\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\shop\models\Order::className(), ['id' => 'shop_order__id'])->via('orderRequisitions');
    }

    /**
     * Gets query for [[shop\models\RequisitionItem]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequisitionItems()
    {
        return $this->hasMany(\shop\models\RequisitionItem::className(), ['shop_requisition__id' => 'id']);
    }
}