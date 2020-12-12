<?php
namespace tarifa\models\base;

/**
 * This is the model class for table "tarifa__tarifa_item".
 *
 * Columns:
* @property integer $tarifa_id  
* @property integer $item_id  
   
 *
 * Relations:
 * @property Item $item
 * @property Tarifa $tarifa
 */
class TarifaItem extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'tarifa__tarifa_item';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'tarifa/config/models/tarifa-item';

    /**
     *
     * @var string
     */
    protected static $_lang = 'tarifa/lang/models/tarifa-item';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tarifa_id', 'item_id'], 'required'],
			[['tarifa_id', 'item_id'], 'number'],
			[['tarifa_id', 'item_id'], 'unique', 'targetAttribute' => ['tarifa_id', 'item_id']],
			[['tarifa_id'], 'exist', 'targetClass' => Tarifa::className(), 'targetAttribute' => ['tarifa_id' => 'id']],
			[['item_id'], 'exist', 'targetClass' => Item::className(), 'targetAttribute' => ['item_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Item]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItem()
    {
        return $this->hasOne(Item::className(), ['id' => 'item_id']);
    }

    /**
     * Gets query for [[Item]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifa()
    {
        return $this->hasOne(Item::className(), ['id' => 'item_id']);
    }
}