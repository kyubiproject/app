<?php
namespace bude\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "bude_precommitment".
 *
 * Columns:
* @property integer $id  
* @property string $created_at  
* @property integer|null $rrhh_department__id  
   
 *
 * Relations:
 * @property \bude\models\Commitment[] $commitments
 * @property \bude\models\Moment $moment
 * @property \bude\models\PrecommitmentCommitment[] $precommitmentCommitments
 */
class Precommitment extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bude_precommitment';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['rrhh_department__id'], 'is', 'type' => 'smallint'],
			[['created_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['id'], 'exist', 'targetClass' => \bude\models\Moment::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[bude\models\Commitment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCommitments()
    {
        return $this->hasMany(\bude\models\Commitment::className(), ['id' => 'bude_commitment__id'])->via('precommitmentCommitments');
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
        return $this->hasMany(\bude\models\PrecommitmentCommitment::className(), ['bude_precommitment__id' => 'id']);
    }
}