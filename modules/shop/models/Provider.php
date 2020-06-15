<?php
namespace shop\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "shop_provider".
 *
 * Columns:
* @property integer $id  
* @property boolean $is_active {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
* @property string $created_at  
   
 *
 * Relations:
 * @property \common\models\Company $company
 * @property \shop\models\Order[] $orders
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
        return 'shop_provider';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','is_active'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['is_active'], 'boolean'],
			[['created_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['id'], 'exist', 'targetClass' => \common\models\Company::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[common\models\Company]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCompany()
    {
        return $this->hasOne(\common\models\Company::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[shop\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\shop\models\Order::className(), ['shop_provider__id' => 'id']);
    }
}