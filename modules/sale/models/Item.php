<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__item".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property boolean|null $is_pack  
* @property integer|null $sale__item__id  
   
 *
 * Relations:
 * @property \sale\models\Item $item
 * @property \sale\models\ItemInfo $itemInfo
 * @property \sale\models\ItemPack[] $itemPacks
 * @property \sale\models\ItemRate[] $itemRates
 * @property \sale\models\ItemStock[] $itemStocks
 * @property \sale\models\Item[] $items
 * @property \sale\models\OrderItem[] $orderItems
 * @property \sale\models\Rate[] $rates
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
        return 'sale__item';
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
			[['id','sale__item__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['name'], 'string', 'max' => 128],
			[['is_pack'], 'boolean'],
			[['is_pack'], 'default', 'value' => 0],
			[['sale__item__id'], 'exist', 'targetClass' => \sale\models\Item::className(),'targetAttribute' => ['sale__item__id' => id]]        
        ];
    }

    /**
     * Gets query for [[sale\models\Item]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItem()
    {
        return $this->hasOne(\sale\models\Item::className(), ['id' => 'sale__item__id']);
    }

    /**
     * Gets query for [[sale\models\ItemInfo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItemInfo()
    {
        return $this->hasOne(\sale\models\ItemInfo::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[sale\models\ItemPack]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItemPacks()
    {
        return $this->hasMany(\sale\models\ItemPack::className(), ['sale__item__id' => 'id']);
    }

    /**
     * Gets query for [[sale\models\ItemRate]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItemRates()
    {
        return $this->hasMany(\sale\models\ItemRate::className(), ['sale__item__id' => 'id']);
    }

    /**
     * Gets query for [[sale\models\ItemStock]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItemStocks()
    {
        return $this->hasMany(\sale\models\ItemStock::className(), ['sale__item__id' => 'id']);
    }

    /**
     * Gets query for [[sale\models\Item]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(\sale\models\Item::className(), ['sale__item__id' => 'id']);
    }

    /**
     * Gets query for [[sale\models\OrderItem]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderItems()
    {
        return $this->hasMany(\sale\models\OrderItem::className(), ['sale__item__id' => 'id']);
    }

    /**
     * Gets query for [[sale\models\Rate]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRates()
    {
        return $this->hasMany(\sale\models\Rate::className(), ['id' => 'sale__rate__id'])->via('itemRates');
    }
}