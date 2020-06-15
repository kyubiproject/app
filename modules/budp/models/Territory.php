<?php
namespace budp\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "budp_territory".
 *
 * Columns:
* @property integer $id  
* @property string $code {"rules":["uniqueMix"]} 
* @property integer $position {"rules":["uniqueMix","min:1","max:10"]} 
* @property string $name  
   
 *
 * Relations:
 * @property \common\models\Level $level
 */
class Territory extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'budp_territory';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','code','position','name'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['position'], 'is', 'type' => 'tinyint'],
			[['code'], 'string', 'max' => 10],
			[['name'], 'string', 'max' => 100],
			[{'{\'targetAttribute\':[\'code\',\'position\']}':'name'}, 'unique'],
			[['id'], 'exist', 'targetClass' => \common\models\Level::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[common\models\Level]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLevel()
    {
        return $this->hasOne(\common\models\Level::className(), ['id' => 'id']);
    }
}