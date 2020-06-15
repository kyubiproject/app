<?php
namespace bude\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "bude_precommitment_commitment".
 *
 * Columns:
* @property integer $bude_precommitment__id  
* @property integer $bude_commitment__id  
   
 *
 * Relations:
 * @property \bude\models\Commitment $commitment
 * @property \bude\models\Precommitment $precommitment
 */
class PrecommitmentCommitment extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bude_precommitment_commitment';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['bude_precommitment__id','bude_commitment__id'], 'required'],
			[['bude_precommitment__id','bude_commitment__id'], 'is', 'type' => 'int'],
			[{'{\'targetAttribute\':[\'bude_precommitment__id\',\'bude_commitment__id\']}':'bude_commitment__id'}, 'unique'],
			[['bude_commitment__id'], 'exist', 'targetClass' => \bude\models\Commitment::className(), 'targetAttribute' => ['bude_commitment__id' => 'id']],
			[['bude_precommitment__id'], 'exist', 'targetClass' => \bude\models\Precommitment::className(), 'targetAttribute' => ['bude_precommitment__id' => 'id']]        
        ];
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

    /**
     * Gets query for [[bude\models\Precommitment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPrecommitment()
    {
        return $this->hasOne(\bude\models\Precommitment::className(), ['id' => 'bude_precommitment__id']);
    }
}