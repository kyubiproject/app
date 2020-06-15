<?php
namespace common\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "common_phone".
 *
 * Columns:
* @property integer $id  
* @property string $type {"list":{"es":{"0":"Local","1":"Celular","2":"Fax"},"en":{"0":"Local","1":"Cellular","2":"Fax"}}} 
* @property string $phone_number  
* @property integer $common_info__id  
   
 *
 * Relations:
 * @property \common\models\Info $info
 */
class Phone extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_phone';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['type','phone_number','common_info__id'], 'required'],
			[['id','common_info__id'], 'is', 'type' => 'int'],
			[['type'], 'string', 'max' => 1],
			[['phone_number'], 'string', 'max' => 11],
			[['common_info__id'], 'exist', 'targetClass' => \common\models\Info::className(), 'targetAttribute' => ['common_info__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[common\models\Info]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getInfo()
    {
        return $this->hasOne(\common\models\Info::className(), ['id' => 'common_info__id']);
    }
}