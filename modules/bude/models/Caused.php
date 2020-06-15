<?php
namespace bude\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "bude_caused".
 *
 * Columns:
* @property integer $id  
* @property string $created_at  
   
 *
 * Relations:
 * @property \bude\models\CommitmentCaused[] $commitmentCauseds
 * @property \bude\models\Commitment[] $commitments
 * @property \bude\models\Moment $moment
 * @property \bude\models\PaidCaused[] $paidCauseds
 * @property \bude\models\Paid[] $paids
 */
class Caused extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bude_caused';
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
			[['created_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['id'], 'exist', 'targetClass' => \bude\models\Moment::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[bude\models\CommitmentCaused]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCommitmentCauseds()
    {
        return $this->hasMany(\bude\models\CommitmentCaused::className(), ['bude_caused__id' => 'id']);
    }

    /**
     * Gets query for [[bude\models\Commitment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCommitments()
    {
        return $this->hasMany(\bude\models\Commitment::className(), ['id' => 'bude_commitment__id'])->via('commitmentCauseds');
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
     * Gets query for [[bude\models\PaidCaused]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPaidCauseds()
    {
        return $this->hasMany(\bude\models\PaidCaused::className(), ['bude_caused__id' => 'id']);
    }

    /**
     * Gets query for [[bude\models\Paid]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPaids()
    {
        return $this->hasMany(\bude\models\Paid::className(), ['id' => 'bude_paid__id'])->via('paidCauseds');
    }
}