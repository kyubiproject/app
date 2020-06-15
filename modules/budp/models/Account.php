<?php
namespace budp\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "budp_account".
 *
 * Columns:
* @property integer $id  
* @property string $code {"rules":["uniqueMix"]} 
* @property integer $position {"rules":["uniqueMix","min:1","max:10"]} 
* @property string|null $name  
* @property string|null $note  
* @property boolean $is_active {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
   
 *
 * Relations:
 * @property \common\models\Level $level
 */
class Account extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'budp_account';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','code','position','is_active'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['position'], 'is', 'type' => 'tinyint'],
			[['code'], 'string', 'max' => 20],
			[['name'], 'string', 'max' => 100],
			[['note'], 'string', 'max' => 500],
			[['is_active'], 'boolean'],
			[{'{\'targetAttribute\':[\'code\',\'position\']}':'is_active'}, 'unique'],
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