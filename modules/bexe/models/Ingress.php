<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__ingress".
 *
 * Columns:
* @property integer $id  
* @property integer $bcon__resource__id  
* @property integer $period  
* @property string $distribution  
* @property double|null $amount  
   
 *
 * Relations:
 * @property \bcon\models\Resource $resource
 */
class Ingress extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__ingress';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['bcon__resource__id','period','distribution'], 'required'],
			[['id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['bcon__resource__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['period'], 'is', 'type' => "year"],
			[['amount'], 'is', 'type' => "double",'size' => null],
			[['distribution'], 'range', 'range' => ['1', '2', '3', '6', '12'],'strict' => true],
			[{'{\'targetAttribute\':[\'bcon__resource__id\',\'period\']}':'amount'}, 'unique'],
			[['bcon__resource__id'], 'exist', 'targetClass' => \bcon\models\Resource::className(),'targetAttribute' => ['bcon__resource__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bcon\models\Resource]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getResource()
    {
        return $this->hasOne(\bcon\models\Resource::className(), ['id' => 'bcon__resource__id']);
    }
}