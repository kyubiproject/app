<?php
namespace bude\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "bude_paid_caused".
 *
 * Columns:
* @property integer $bude_paid__id  
* @property integer $bude_caused__id  
   
 *
 * Relations:
 * @property \bude\models\Caused $caused
 * @property \bude\models\Paid $paid
 */
class PaidCaused extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bude_paid_caused';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['bude_paid__id','bude_caused__id'], 'required'],
			[['bude_paid__id','bude_caused__id'], 'is', 'type' => 'int'],
			[{'{\'targetAttribute\':[\'bude_paid__id\',\'bude_caused__id\']}':'bude_caused__id'}, 'unique'],
			[['bude_caused__id'], 'exist', 'targetClass' => \bude\models\Caused::className(), 'targetAttribute' => ['bude_caused__id' => 'id']],
			[['bude_paid__id'], 'exist', 'targetClass' => \bude\models\Paid::className(), 'targetAttribute' => ['bude_paid__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[bude\models\Caused]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCaused()
    {
        return $this->hasOne(\bude\models\Caused::className(), ['id' => 'bude_caused__id']);
    }

    /**
     * Gets query for [[bude\models\Paid]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPaid()
    {
        return $this->hasOne(\bude\models\Paid::className(), ['id' => 'bude_paid__id']);
    }
}