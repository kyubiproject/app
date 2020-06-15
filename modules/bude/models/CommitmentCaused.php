<?php
namespace bude\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "bude_commitment_caused".
 *
 * Columns:
* @property integer $bude_commitment__id  
* @property integer $bude_caused__id  
   
 *
 * Relations:
 * @property \bude\models\Caused $caused
 * @property \bude\models\Commitment $commitment
 */
class CommitmentCaused extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bude_commitment_caused';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['bude_commitment__id','bude_caused__id'], 'required'],
			[['bude_commitment__id','bude_caused__id'], 'is', 'type' => 'int'],
			[{'{\'targetAttribute\':[\'bude_caused__id\',\'bude_commitment__id\']}':'bude_caused__id'}, 'unique'],
			[['bude_caused__id'], 'exist', 'targetClass' => \bude\models\Caused::className(), 'targetAttribute' => ['bude_caused__id' => 'id']],
			[['bude_commitment__id'], 'exist', 'targetClass' => \bude\models\Commitment::className(), 'targetAttribute' => ['bude_commitment__id' => 'id']]        
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
     * Gets query for [[bude\models\Commitment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCommitment()
    {
        return $this->hasOne(\bude\models\Commitment::className(), ['id' => 'bude_commitment__id']);
    }
}