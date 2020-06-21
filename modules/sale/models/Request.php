<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__request".
 *
 * Columns:
* @property integer $id  
* @property string $number  
* @property string $date  
* @property string|null $valid_date  
* @property string|null $note  
   
 *
 * Relations:
 * @property \sale\models\Order $order
 */
class Request extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'sale__request';
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