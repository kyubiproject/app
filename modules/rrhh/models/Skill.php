<?php
namespace rrhh\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rrhh_skill".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property integer $rrhh_employee__id  
   
 *
 * Relations:
 * @property \rrhh\models\Employee $employee
 */
class Skill extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rrhh_skill';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name','rrhh_employee__id'], 'required'],
			[['id','rrhh_employee__id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 100],
			[['rrhh_employee__id'], 'exist', 'targetClass' => \rrhh\models\Employee::className(), 'targetAttribute' => ['rrhh_employee__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[rrhh\models\Employee]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEmployee()
    {
        return $this->hasOne(\rrhh\models\Employee::className(), ['id' => 'rrhh_employee__id']);
    }
}