<?php
namespace common\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "common_company".
 *
 * Columns:
* @property integer $id  
* @property string $rif {"rules":["unique"]} 
* @property string|null $nit {"rules":["unique"]} 
* @property string $name  
* @property string|null $acronym {"rules":["upper"]} 
   
 *
 * Relations:
 * @property \common\models\Info $info
 * @property \shop\models\Provider $provider
 */
class Company extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_company';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','rif','name'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['rif','nit','acronym'], 'string', 'max' => 10],
			[['name'], 'string', 'max' => 100],
			[['nit','rif'], 'unique'],
			[['id'], 'exist', 'targetClass' => \common\models\Info::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[common\models\Info]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getInfo()
    {
        return $this->hasOne(\common\models\Info::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[shop\models\Provider]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProvider()
    {
        return $this->hasOne(\shop\models\Provider::className(), ['id' => 'id']);
    }
}