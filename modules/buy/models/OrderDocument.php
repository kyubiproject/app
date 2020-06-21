<?php
namespace buy\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "buy__order_document".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property integer|null $size  
* @property string|null $type  
* @property string|null $content  
   
 *
 * Relations:
 * @property \buy\models\Order $order
 */
class OrderDocument extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'buy__order_document';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','name'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['name','type'], 'string', 'max' => 255],
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