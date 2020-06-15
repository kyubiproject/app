<?php
namespace rrhh\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rrhh_employee".
 *
 * Columns:
* @property integer $id  
* @property string $admission_date  
* @property string|null $discharge_date  
* @property string|null $note  
* @property integer $rrhh_position__id  
* @property integer|null $rbac_user__id  
* @property string $created_at  
   
 *
 * Relations:
 * @property \rrhh\models\Curriculum $curriculum
 * @property \rrhh\models\Hobbie[] $hobbies
 * @property \common\models\Person $person
 * @property \rrhh\models\Position $position
 * @property \rrhh\models\Skill[] $skills
 * @property \rbac\models\User $user
 */
class Employee extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rrhh_employee';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','admission_date','rrhh_position__id'], 'required'],
			[['id','rrhh_position__id','rbac_user__id'], 'is', 'type' => 'int'],
			[['admission_date','discharge_date'], 'type', 'type' => 'date', 'dateFormat' => 'yyyy-mm-dd'],
			[['created_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['note'], 'string', 'max' => 500],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['id'], 'exist', 'targetClass' => \common\models\Person::className(), 'targetAttribute' => ['id' => 'id']],
			[['rbac_user__id'], 'exist', 'targetClass' => \rbac\models\User::className(), 'targetAttribute' => ['rbac_user__id' => 'id']],
			[['rrhh_position__id'], 'exist', 'targetClass' => \rrhh\models\Position::className(), 'targetAttribute' => ['rrhh_position__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[rrhh\models\Curriculum]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCurriculum()
    {
        return $this->hasOne(\rrhh\models\Curriculum::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[rrhh\models\Hobbie]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getHobbies()
    {
        return $this->hasMany(\rrhh\models\Hobbie::className(), ['rrhh_employee__id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Person]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPerson()
    {
        return $this->hasOne(\common\models\Person::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[rrhh\models\Position]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPosition()
    {
        return $this->hasOne(\rrhh\models\Position::className(), ['id' => 'rrhh_position__id']);
    }

    /**
     * Gets query for [[rrhh\models\Skill]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSkills()
    {
        return $this->hasMany(\rrhh\models\Skill::className(), ['rrhh_employee__id' => 'id']);
    }

    /**
     * Gets query for [[rbac\models\User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(\rbac\models\User::className(), ['id' => 'rbac_user__id']);
    }
}