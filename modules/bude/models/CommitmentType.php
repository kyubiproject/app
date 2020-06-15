<?php
namespace bude\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "bude_commitment_type".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string $code {"rules":["unique"]} 
* @property boolean $advanced {"list":{"es":["No","Si"],"en":["No","Yes"]}} 
* @property boolean $agreement {"list":{"es":["No","Si"],"en":["No","Yes"]}} 
* @property boolean $certificate {"list":{"es":["Única","Multiples"],"en":["Single","Multiple"]}} 
* @property boolean $payment {"list":{"es":["Único","Multiples"],"en":["Single","Multiple"]}} 
* @property boolean $is_active {"list":{"es":["No","Si"],"en":["No","Yes"]}} 
   
 *
 * Relations:
 * @property \bude\models\Commitment[] $commitments
 */
class CommitmentType extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bude_commitment_type';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name','code','advanced','agreement','certificate','payment','is_active'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 50],
			[['code'], 'string', 'max' => 5],
			[['advanced','agreement','certificate','payment','is_active'], 'boolean'],
			[['code'], 'unique']        
        ];
    }

    /**
     * Gets query for [[bude\models\Commitment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCommitments()
    {
        return $this->hasMany(\bude\models\Commitment::className(), ['bude_commitment_type__id' => 'id']);
    }
}