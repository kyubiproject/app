<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__modification_balance".
 *
 * Columns:
* @property integer $id  
* @property integer $bexe__modification__id  
* @property integer $bexe__egress__id  
* @property double $amount  
   
 *
 * Relations:
 * @property \bexe\models\Egress $egress
 * @property \bexe\models\Modification $modification
 */
class ModificationBalance extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__modification_balance';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['bexe__modification__id','bexe__egress__id','amount'], 'required'],
			[['id','bexe__modification__id','bexe__egress__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['amount'], 'is', 'type' => "double",'size' => "20, 2"],
			[{'{\'targetAttribute\':[\'bexe__egress__id\',\'bexe__modification__id\']}':'amount'}, 'unique'],
			[['bexe__modification__id'], 'exist', 'targetClass' => \bexe\models\Modification::className(),'targetAttribute' => ['bexe__modification__id' => id]],
			[['bexe__egress__id'], 'exist', 'targetClass' => \bexe\models\Egress::className(),'targetAttribute' => ['bexe__egress__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bexe\models\Egress]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEgress()
    {
        return $this->hasOne(\bexe\models\Egress::className(), ['id' => 'bexe__egress__id']);
    }

    /**
     * Gets query for [[bexe\models\Modification]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModification()
    {
        return $this->hasOne(\bexe\models\Modification::className(), ['id' => 'bexe__modification__id']);
    }
}