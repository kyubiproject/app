<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__moment_balance".
 *
 * Columns:
* @property integer $id  
* @property integer|null $bexe__moment__id  
* @property integer|null $bexe__egress__id  
* @property boolean $flag  
* @property double|null $avilable  
* @property double|null $amount  
* @property string $created_at  
   
 *
 * Relations:
 * @property \bexe\models\Egress $egress
 * @property \bexe\models\Moment $moment
 */
class MomentBalance extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__moment_balance';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[[], 'required'],
			[['id','bexe__moment__id','bexe__egress__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['avilable','amount'], 'is', 'type' => "double",'size' => "20, 2"],
			[['flag'], 'boolean'],
			[['flag'], 'default', 'value' => 0],
			[['created_at'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
			[['created_at'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[{'{\'targetAttribute\':[\'bexe__egress__id\',\'bexe__moment__id\',\'flag\']}':'created_at'}, 'unique'],
			[['bexe__moment__id'], 'exist', 'targetClass' => \bexe\models\Moment::className(),'targetAttribute' => ['bexe__moment__id' => id]],
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
     * Gets query for [[bexe\models\Moment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoment()
    {
        return $this->hasOne(\bexe\models\Moment::className(), ['id' => 'bexe__moment__id']);
    }
}