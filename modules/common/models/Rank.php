<?php
namespace common\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "common_rank".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $acronym {"rules":["upper"]} 
* @property string $type {"rules":["uniqueMix"],"list":{"es":{"C":"Categoría","A":"Cuenta","R":"Recurso","E":"Egreso","T":"Territorio"},"en":{"C":"Category","A":"Account","R":"Resource","E":"Egress","T":"Territory"}}} 
* @property integer $position {"rules":["uniqueMix","min:1","max:10"]} 
* @property integer $size {"rules":["min:1","max:3"]} 
* @property string|null $separator  
   
 *
 * Relations:
 * @property \common\models\Level[] $levels
 */
class Rank extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_rank';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name','type','position','size'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['position','size'], 'is', 'type' => 'tinyint', 'unsigned' => true],
			[['name'], 'string', 'max' => 50],
			[['acronym'], 'string', 'max' => 5],
			[['type','separator'], 'string', 'max' => 1],
			[{'{\'targetAttribute\':[\'type\',\'position\']}':'separator'}, 'unique']        
        ];
    }

    /**
     * Gets query for [[common\models\Level]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLevels()
    {
        return $this->hasMany(\common\models\Level::className(), ['common_rank__id' => 'id']);
    }
}