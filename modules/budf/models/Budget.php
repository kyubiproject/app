<?php
namespace budf\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "budf_budget".
 *
 * Columns:
* @property integer $id  
* @property string|null $note  
* @property string $start_date  
* @property integer $distribution {"list":{"es":{"1":"Mensual","2":"Bimestral","3":"Trimestral","6":"Semestral"},"en":{"1":"Monthly","2":"Bimonthly","3":"Quarterly","6":"Semester"}}} 
   
 *
 * Relations:
 * @property \budf\models\Certificate $certificate
 * @property \budf\models\Ingress $ingress
 * @property \budf\models\Period[] $periods
 */
class Budget extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'budf_budget';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['start_date','distribution'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['distribution'], 'is', 'type' => 'tinyint'],
			[['note'], 'string', 'max' => 500],
			[['start_date'], 'type', 'type' => 'date', 'dateFormat' => 'yyyy-mm-dd']        
        ];
    }

    /**
     * Gets query for [[budf\models\Certificate]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCertificate()
    {
        return $this->hasOne(\budf\models\Certificate::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[budf\models\Ingress]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIngress()
    {
        return $this->hasOne(\budf\models\Ingress::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[budf\models\Period]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPeriods()
    {
        return $this->hasMany(\budf\models\Period::className(), ['budf_budget__id' => 'id']);
    }
}