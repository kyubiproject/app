<?php
namespace rrhh\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rrhh_position".
 *
 * Columns:
* @property integer $id  
* @property string $code {"rules":["uniqueMix"]} 
* @property integer $position {"rules":["uniqueMix","min:1","max:10"]} 
* @property string $name  
* @property string|null $responsible  
* @property boolean $is_active {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
   
 *
 * Relations:
 * @property \rrhh\models\Employee[] $employees
 * @property \common\models\Level $level
 */
class Position extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rrhh_position';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','code','position','name','is_active'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['position'], 'is', 'type' => 'tinyint'],
			[['code'], 'string', 'max' => 10],
			[['name','responsible'], 'string', 'max' => 100],
			[['is_active'], 'boolean'],
			[{'{\'targetAttribute\':[\'code\',\'position\']}':'is_active'}, 'unique'],
			[['id'], 'exist', 'targetClass' => \common\models\Level::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[rrhh\models\Employee]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEmployees()
    {
        return $this->hasMany(\rrhh\models\Employee::className(), ['rrhh_position__id' => 'id']);
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