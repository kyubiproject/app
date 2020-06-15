<?php
namespace budp\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "budp_source".
 *
 * Columns:
* @property integer $id  
* @property integer|null $code {"rules":["unique"]} 
* @property string $name  
* @property string|null $acronym {"rules":["upper"]} 
* @property boolean $is_ordinal {"list":{"es":["Extraordinaria","Ordinaria"],"en":["Extraordinary","Ordinary"]}} 
* @property integer|null $budp_source__id  
   
 *
 * Relations:
 * @property \budf\models\CertificateSource[] $certificateSources
 * @property \budp\models\Source $source
 * @property \budp\models\Source[] $sources
 */
class Source extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'budp_source';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name','is_ordinal'], 'required'],
			[['id','budp_source__id'], 'is', 'type' => 'int'],
			[['code'], 'is', 'type' => 'tinyint'],
			[['name'], 'string', 'max' => 100],
			[['acronym'], 'string', 'max' => 10],
			[['is_ordinal'], 'boolean'],
			[['code'], 'unique'],
			[['budp_source__id'], 'exist', 'targetClass' => \budp\models\Source::className(), 'targetAttribute' => ['budp_source__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[budf\models\CertificateSource]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCertificateSources()
    {
        return $this->hasMany(\budf\models\CertificateSource::className(), ['budp_source__id' => 'id']);
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

    /**
     * Gets query for [[budp\models\Source]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSources()
    {
        return $this->hasMany(\budp\models\Source::className(), ['budp_source__id' => 'id']);
    }
}