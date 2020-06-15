<?php
namespace bude\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "bude_moment_certificate".
 *
 * Columns:
* @property integer $id  
* @property integer $bude_moment__id {"rules":["uniqueMix"]} 
* @property integer $budf_certificate__id {"rules":["uniqueMix"]} 
* @property double $available_amount  
* @property double|null $precommitment_amount  
* @property double|null $commitment_amount  
* @property double|null $caused_amount  
* @property double|null $paid_amount  
   
 *
 * Relations:
 * @property \budf\models\Certificate $certificate
 * @property \bude\models\Moment $moment
 */
class MomentCertificate extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bude_moment_certificate';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['bude_moment__id','budf_certificate__id','available_amount'], 'required'],
			[['id','bude_moment__id','budf_certificate__id'], 'is', 'type' => 'int'],
			[['available_amount','precommitment_amount','commitment_amount','caused_amount','paid_amount'], 'is', 'type' => 'decimal', 'size' => '20, 2'],
			[['bude_moment__id'], 'exist', 'targetClass' => \bude\models\Moment::className(), 'targetAttribute' => ['bude_moment__id' => 'id']],
			[['budf_certificate__id'], 'exist', 'targetClass' => \budf\models\Certificate::className(), 'targetAttribute' => ['budf_certificate__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[budf\models\Certificate]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCertificate()
    {
        return $this->hasOne(\budf\models\Certificate::className(), ['id' => 'budf_certificate__id']);
    }

    /**
     * Gets query for [[bude\models\Moment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoment()
    {
        return $this->hasOne(\bude\models\Moment::className(), ['id' => 'bude_moment__id']);
    }
}