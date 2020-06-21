<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__item_info".
 *
 * Columns:
* @property integer $id  
* @property string|null $sku  
* @property integer|null $upc  
* @property string|null $tags  
* @property float|null $size  
* @property float|null $stock_max  
* @property float|null $qty_min  
* @property float|null $qty_max  
* @property string|null $size_unit  
* @property float|null $stock_min  
   
 *
 * Relations:
 * @property \sale\models\Item $item
 */
class ItemInfo extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'sale__item_info';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['upc'], 'is', 'type' => "mediumint",'unsigned' => true],
			[['size','stock_max','qty_min','qty_max','stock_min'], 'is', 'type' => "float",'size' => "7, 3"],
			[['sku'], 'string', 'max' => 12],
			[['tags'], 'string', 'max' => 64],
			[['size_unit'], 'string', 'max' => 8],
			[['id'], 'exist', 'targetClass' => \sale\models\Item::className(),'targetAttribute' => ['id' => id]]        
        ];
    }

    /**
     * Gets query for [[sale\models\Item]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItem()
    {
        return $this->hasOne(\sale\models\Item::className(), ['id' => 'id']);
    }
}