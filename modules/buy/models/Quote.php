<?php
namespace buy\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "buy__quote".
 *
 * Columns:
* @property integer $id  
* @property string $number  
* @property string $date  
* @property string|null $valid_date  
* @property string|null $note  
   
 *
 * Relations:
 * @property \buy\models\Order $order
 */
class Quote extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'buy__quote';
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
			[['number'], 'string', 'max' => 10],
			[['date','valid_date'], 'type', 'type' => "date",'dateFormat' => "yyyy-mm-dd"],
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