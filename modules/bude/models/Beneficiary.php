<?php
namespace bude\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "bude_beneficiary".
 *
 * Columns:
* @property integer $id  
* @property boolean $is_active {"list":{"es":["No","Si"],"en":["No","Yes"]}} 
* @property string $created_at  
   
 *
 * Relations:
 * @property \common\models\Info $info
 * @property \bude\models\Moment[] $moments
 */
class Beneficiary extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bude_beneficiary';
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
     * Gets query for [[bude\models\Moment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoments()
    {
        return $this->hasMany(\bude\models\Moment::className(), ['bude_beneficiary__id' => 'id']);
    }
}