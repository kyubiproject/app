<?php
namespace budf\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "budf_certificate".
 *
 * Columns:
* @property integer $id  
* @property string $code {"rules":["unique"]} 
* @property integer $year {"rules":["uniqueMix"]} 
* @property integer $budp_sorter__id {"rules":["uniqueMix"]} 
* @property integer $budp_category__id {"rules":["uniqueMix"]} 
   
 *
 * Relations:
 * @property \budf\models\Budget $budget
 * @property \budp\models\Category $category
 * @property \budf\models\CertificateSource[] $certificateSources
 * @property \bude\models\MomentCertificate[] $momentCertificates
 * @property \budp\models\Sorter $sorter
 */
class Certificate extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'budf_certificate';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','code','year','budp_sorter__id','budp_category__id'], 'required'],
			[['id','budp_sorter__id','budp_category__id'], 'is', 'type' => 'int'],
			[['year'], 'is', 'type' => 'year'],
			[['code'], 'string', 'max' => 30],
			[{'0':'code','{\'targetAttribute\':[\'budp_category__id\',\'budp_sorter__id\',\'year\']}':'budp_category__id'}, 'unique'],
			[['id'], 'exist', 'targetClass' => \budf\models\Budget::className(), 'targetAttribute' => ['id' => 'id']],
			[['budp_category__id'], 'exist', 'targetClass' => \budp\models\Category::className(), 'targetAttribute' => ['budp_category__id' => 'id']],
			[['budp_sorter__id'], 'exist', 'targetClass' => \budp\models\Sorter::className(), 'targetAttribute' => ['budp_sorter__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[budf\models\Budget]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBudget()
    {
        return $this->hasOne(\budf\models\Budget::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[budp\models\Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(\budp\models\Category::className(), ['id' => 'budp_category__id']);
    }

    /**
     * Gets query for [[budf\models\CertificateSource]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCertificateSources()
    {
        return $this->hasMany(\budf\models\CertificateSource::className(), ['budf_certificate__id' => 'id']);
    }

    /**
     * Gets query for [[bude\models\MomentCertificate]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMomentCertificates()
    {
        return $this->hasMany(\bude\models\MomentCertificate::className(), ['budf_certificate__id' => 'id']);
    }

    /**
     * Gets query for [[budp\models\Sorter]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSorter()
    {
        return $this->hasOne(\budp\models\Sorter::className(), ['id' => 'budp_sorter__id']);
    }
}