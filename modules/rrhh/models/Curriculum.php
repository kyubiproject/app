<?php
namespace rrhh\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rrhh_curriculum".
 *
 * Columns:
* @property integer $id  
* @property string|null $url_curriculum  
* @property string|null $skills  
* @property string|null $hoobies  
   
 *
 * Relations:
 * @property \rrhh\models\Employee $employee
 * @property \rrhh\models\Experience[] $experiences
 */
class Curriculum extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rrhh_curriculum';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['url_curriculum'], 'string', 'max' => 255],
			[['skills','hoobies'], 'string', 'max' => 500],
			[['id'], 'exist', 'targetClass' => \rrhh\models\Employee::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[rrhh\models\Employee]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEmployee()
    {
        return $this->hasOne(\rrhh\models\Employee::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[rrhh\models\Experience]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getExperiences()
    {
        return $this->hasMany(\rrhh\models\Experience::className(), ['rrhh_curriculum__id' => 'id']);
    }
}