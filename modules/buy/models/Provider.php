<?php
namespace buy\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "buy__provider".
 *
 * Columns:
* @property integer $id  
* @property string $dni  
* @property string|null $name  
* @property string|null $note  
   
 *
 * Relations:
 * @property \buy\models\Order[] $orders
 */
class Provider extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'buy__provider';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['dni'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['dni'], 'string', 'max' => 12],
			[['name'], 'string', 'max' => 128],
			[['dni'], 'unique']        
        ];
    }

    /**
     * Gets query for [[buy\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\buy\models\Order::className(), ['buy__provider__id' => 'id']);
    }
}