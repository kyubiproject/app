<?php
namespace buy\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "buy__invoice".
 *
 * Columns:
* @property integer $id  
* @property string $number  
* @property string $date  
* @property string|null $control  
* @property string|null $note  
   
 *
 * Relations:
 * @property \buy\models\Order $order
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
        return 'buy__invoice';
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
			[['id'], 'exist', 'targetClass' => \buy\models\Order::className(),'targetAttribute' => ['id' => id]]        
        ];
    }

    /**
     * Gets query for [[buy\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrder()
    {
        return $this->hasOne(\buy\models\Order::className(), ['id' => 'id']);
    }
}