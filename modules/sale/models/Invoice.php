<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__invoice".
 *
 * Columns:
* @property integer $id  
* @property string $number  
* @property string $date  
* @property string|null $control  
* @property string|null $note  
   
 *
 * Relations:
 * @property \sale\models\Order $order
 */
class Invoice extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'sale__invoice';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','number','date'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['number','control'], 'string', 'max' => 10],
			[['date'], 'type', 'type' => "date",'dateFormat' => "yyyy-mm-dd"],
			[['id'], 'exist', 'targetClass' => \sale\models\Order::className(),'targetAttribute' => ['id' => id]]        
        ];
    }

    /**
     * Gets query for [[sale\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrder()
    {
        return $this->hasOne(\sale\models\Order::className(), ['id' => 'id']);
    }
}