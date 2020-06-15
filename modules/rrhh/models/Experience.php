<?php
namespace rrhh\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rrhh_experience".
 *
 * Columns:
* @property integer $id  
* @property string $company  
* @property string $position  
* @property string $admission_date  
* @property string $discharge_date  
* @property integer $rrhh_curriculum__id  
   
 *
 * Relations:
 * @property \rrhh\models\Curriculum $curriculum
 */
class Experience extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rrhh_experience';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['company','position','admission_date','discharge_date','rrhh_curriculum__id'], 'required'],
			[['id','rrhh_curriculum__id'], 'is', 'type' => 'int'],
			[['company','position'], 'string', 'max' => 200],
			[['admission_date','discharge_date'], 'type', 'type' => 'date', 'dateFormat' => 'yyyy-mm-dd'],
			[['rrhh_curriculum__id'], 'exist', 'targetClass' => \rrhh\models\Curriculum::className(), 'targetAttribute' => ['rrhh_curriculum__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[rrhh\models\Curriculum]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCurriculum()
    {
        return $this->hasOne(\rrhh\models\Curriculum::className(), ['id' => 'rrhh_curriculum__id']);
    }
}