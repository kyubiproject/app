<?php
namespace bude\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "bude_moment".
 *
 * Columns:
* @property integer $id  
* @property string $code {"rules":["unique"]} 
* @property string $note  
* @property string|null $annulled_at  
* @property integer|null $bude_beneficiary__id  
   
 *
 * Relations:
 * @property \bude\models\Beneficiary $beneficiary
 * @property \bude\models\Caused $caused
 * @property \bude\models\Commitment $commitment
 * @property \bude\models\MomentCertificate[] $momentCertificates
 * @property \bude\models\Paid $paid
 * @property \bude\models\Precommitment $precommitment
 */
class Moment extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bude_moment';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['code','note'], 'required'],
			[['id','bude_beneficiary__id'], 'is', 'type' => 'int'],
			[['code'], 'string', 'max' => 10],
			[['note'], 'string', 'max' => 500],
			[['annulled_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['code'], 'unique'],
			[['bude_beneficiary__id'], 'exist', 'targetClass' => \bude\models\Beneficiary::className(), 'targetAttribute' => ['bude_beneficiary__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[bude\models\Beneficiary]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBeneficiary()
    {
        return $this->hasOne(\bude\models\Beneficiary::className(), ['id' => 'bude_beneficiary__id']);
    }

    /**
     * Gets query for [[bude\models\Caused]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCaused()
    {
        return $this->hasOne(\bude\models\Caused::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bude\models\Commitment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCommitment()
    {
        return $this->hasOne(\bude\models\Commitment::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bude\models\MomentCertificate]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMomentCertificates()
    {
        return $this->hasMany(\bude\models\MomentCertificate::className(), ['bude_moment__id' => 'id']);
    }

    /**
     * Gets query for [[bude\models\Paid]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPaid()
    {
        return $this->hasOne(\bude\models\Paid::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bude\models\Precommitment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPrecommitment()
    {
        return $this->hasOne(\bude\models\Precommitment::className(), ['id' => 'id']);
    }
}