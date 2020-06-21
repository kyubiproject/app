<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__compromise_type".
 *
 * Columns:
* @property integer $id  
* @property string $code  
* @property string $name  
* @property string|null $note  
* @property boolean|null $advanced  
* @property boolean|null $budget  
* @property boolean|null $invoice  
* @property boolean|null $payment  
   
 *
 * Relations:
 * @property \bexe\models\Compromise[] $compromises
 */
class CompromiseType extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__compromise_type';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['code','name'], 'required'],
			[['id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['code'], 'string', 'max' => 2],
			[['name'], 'string', 'max' => 64],
			[['advanced','budget','invoice','payment'], 'boolean'],
			[['advanced','budget','invoice','payment'], 'default', 'value' => 0],
			[['code'], 'unique']        
        ];
    }

    /**
     * Gets query for [[bexe\models\Compromise]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCompromises()
    {
        return $this->hasMany(\bexe\models\Compromise::className(), ['bexe__compromise_type__id' => 'id']);
    }
}