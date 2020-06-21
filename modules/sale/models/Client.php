<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__client".
 *
 * Columns:
* @property integer $id  
* @property string $dni  
* @property string|null $name  
   
 *
 * Relations:
 * @property \sale\models\Order[] $orders
 */
class Client extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'sale__client';
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
     * Gets query for [[sale\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\sale\models\Order::className(), ['sale__client__id' => 'id']);
    }
}