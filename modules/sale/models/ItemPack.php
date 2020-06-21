<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__item_pack".
 *
 * Columns:
* @property integer $id  
* @property integer $sale__item__id  
* @property float $qty  
   
 *
 * Relations:
 * @property \sale\models\Item $item
 */
class ItemPack extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'sale__item_pack';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','sale__item__id','qty'], 'required'],
			[['id','sale__item__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['qty'], 'is', 'type' => "float",'size' => "7, 3"],
			[{'{\'targetAttribute\':[\'id\',\'sale__item__id\']}':'qty'}, 'unique'],
			[['id'], 'exist', 'targetClass' => \sale\models\Item::className(),'targetAttribute' => ['id' => id]],
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