<?php
namespace buy\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "buy__request".
 *
 * Columns:
* @property integer $id  
* @property string|null $number  
* @property string $date  
* @property string|null $department  
* @property string|null $category  
* @property string|null $valid_date  
* @property string|null $note  
   
 *
 * Relations:
 * @property \buy\models\Order $order
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
        return 'buy__request';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','date'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['number'], 'string', 'max' => 10],
			[['department'], 'string', 'max' => 64],
			[['category'], 'string', 'max' => 128],
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