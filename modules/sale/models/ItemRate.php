<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__item_rate".
 *
 * Columns:
* @property integer $sale__item__id  
* @property integer $sale__rate__id  
* @property string $created_at  
   
 *
 * Relations:
 * @property \sale\models\Item $item
 * @property \sale\models\Rate $rate
 */
class ItemRate extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'sale__item_rate';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['sale__item__id','sale__rate__id'], 'required'],
			[['sale__item__id','sale__rate__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['created_at'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['created_at'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
			[{'{\'targetAttribute\':[\'sale__item__id\',\'sale__rate__id\']}':'created_at'}, 'unique'],
			[['sale__item__id'], 'exist', 'targetClass' => \sale\models\Item::className(),'targetAttribute' => ['sale__item__id' => id]],
			[['sale__rate__id'], 'exist', 'targetClass' => \sale\models\Rate::className(),'targetAttribute' => ['sale__rate__id' => id]]        
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
     * Gets query for [[sale\models\Rate]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRate()
    {
        return $this->hasOne(\sale\models\Rate::className(), ['id' => 'sale__rate__id']);
    }
}