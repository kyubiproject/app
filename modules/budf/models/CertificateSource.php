<?php
namespace budf\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "budf_certificate_source".
 *
 * Columns:
* @property integer $id  
* @property integer $budf_certificate__id {"rules":["uniqueMix"]} 
* @property integer $budp_source__id {"rules":["uniqueMix"]} 
* @property double $assigned_amount  
   
 *
 * Relations:
 * @property \budf\models\Certificate $certificate
 * @property \budp\models\Source $source
 */
class CertificateSource extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'budf_certificate_source';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['budf_certificate__id','budp_source__id','assigned_amount'], 'required'],
			[['id','budf_certificate__id','budp_source__id'], 'is', 'type' => 'int'],
			[['assigned_amount'], 'is', 'type' => 'decimal', 'size' => '20, 2'],
			[{'{\'targetAttribute\':[\'budf_certificate__id\',\'budp_source__id\']}':'assigned_amount'}, 'unique'],
			[['budf_certificate__id'], 'exist', 'targetClass' => \budf\models\Certificate::className(), 'targetAttribute' => ['budf_certificate__id' => 'id']],
			[['budp_source__id'], 'exist', 'targetClass' => \budp\models\Source::className(), 'targetAttribute' => ['budp_source__id' => 'id']]        
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
     * Gets query for [[budp\models\Source]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSource()
    {
        return $this->hasOne(\budp\models\Source::className(), ['id' => 'budp_source__id']);
    }
}