<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__item_stock".
 *
 * Columns:
* @property integer $id  
* @property integer $sale__item__id  
* @property float|null $qty  
* @property double|null $sell  
* @property double|null $buy  
* @property string $created_at  
   
 *
 * Relations:
 * @property \sale\models\Item $item
 */
class ItemStock extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'sale__item_stock';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['sale__item__id'], 'required'],
			[['id'], 'is', 'type' => "mediumint",'unsigned' => true],
			[['sale__item__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['qty'], 'is', 'type' => "float",'size' => "7, 3"],
			[['sell','buy'], 'is', 'type' => "double",'size' => "15, 2",'unsigned' => true],
			[['created_at'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['created_at'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
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
}