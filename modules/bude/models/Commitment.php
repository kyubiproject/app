<?php
namespace bude\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "bude_commitment".
 *
 * Columns:
* @property integer $id  
* @property string $created_at  
* @property integer $bude_commitment_type__id  
   
 *
 * Relations:
 * @property \bude\models\Caused[] $causeds
 * @property \bude\models\CommitmentCaused[] $commitmentCauseds
 * @property \bude\models\CommitmentType $commitmentType
 * @property \bude\models\Moment $moment
 * @property \bude\models\PrecommitmentCommitment[] $precommitmentCommitments
 * @property \bude\models\Precommitment[] $precommitments
 */
class Commitment extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bude_commitment';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','bude_commitment_type__id'], 'required'],
			[['id','bude_commitment_type__id'], 'is', 'type' => 'int'],
			[['created_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['bude_commitment_type__id'], 'exist', 'targetClass' => \bude\models\CommitmentType::className(), 'targetAttribute' => ['bude_commitment_type__id' => 'id']],
			[['id'], 'exist', 'targetClass' => \bude\models\Moment::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[bude\models\Caused]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCauseds()
    {
        return $this->hasMany(\bude\models\Caused::className(), ['id' => 'bude_caused__id'])->via('commitmentCauseds');
    }

    /**
     * Gets query for [[bude\models\CommitmentCaused]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCommitmentCauseds()
    {
        return $this->hasMany(\bude\models\CommitmentCaused::className(), ['bude_commitment__id' => 'id']);
    }

    /**
     * Gets query for [[bude\models\CommitmentType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCommitmentType()
    {
        return $this->hasOne(\bude\models\CommitmentType::className(), ['id' => 'bude_commitment_type__id']);
    }

    /**
     * Gets query for [[bude\models\Moment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoment()
    {
        return $this->hasOne(\bude\models\Moment::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bude\models\PrecommitmentCommitment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPrecommitmentCommitments()
    {
        return $this->hasMany(\bude\models\PrecommitmentCommitment::className(), ['bude_commitment__id' => 'id']);
    }

    /**
     * Gets query for [[bude\models\Precommitment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPrecommitments()
    {
        return $this->hasMany(\bude\models\Precommitment::className(), ['id' => 'bude_precommitment__id'])->via('precommitmentCommitments');
    }
}