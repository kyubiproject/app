<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__rate".
 *
 * Columns:
* @property integer $id  
* @property float $rate  
* @property boolean|null $is_flat  
* @property integer $sale__fee__id  
* @property string $created_at  
   
 *
 * Relations:
 * @property \sale\models\Fee $fee
 * @property \sale\models\ItemRate[] $itemRates
 * @property \sale\models\Item[] $items
 */
class Rate extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'sale__rate';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['rate','sale__fee__id'], 'required'],
			[['id','sale__fee__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['rate'], 'is', 'type' => "float",'size' => "7, 2"],
			[['is_flat'], 'boolean'],
			[['is_flat'], 'default', 'value' => 0],
			[['created_at'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
			[['created_at'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['sale__fee__id'], 'exist', 'targetClass' => \sale\models\Fee::className(),'targetAttribute' => ['sale__fee__id' => id]]        
        ];
    }

    /**
     * Gets query for [[sale\models\Fee]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFee()
    {
        return $this->hasOne(\sale\models\Fee::className(), ['id' => 'sale__fee__id']);
    }

    /**
     * Gets query for [[sale\models\ItemRate]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItemRates()
    {
        return $this->hasMany(\sale\models\ItemRate::className(), ['sale__rate__id' => 'id']);
    }

    /**
     * Gets query for [[sale\models\Item]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(\sale\models\Item::className(), ['id' => 'sale__item__id'])->via('itemRates');
    }
}