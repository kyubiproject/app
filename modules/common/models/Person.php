<?php
namespace common\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "common_person".
 *
 * Columns:
* @property integer $id  
* @property string $dni {"rules":["unique"]} 
* @property string $name  
* @property string $last_name  
* @property string|null $birth_date  
   
 *
 * Relations:
 * @property \rrhh\models\Employee $employee
 * @property \common\models\Info $info
 */
class Person extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_person';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','dni','name','last_name'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['dni'], 'string', 'max' => 9],
			[['name','last_name'], 'string', 'max' => 50],
			[['birth_date'], 'type', 'type' => 'date', 'dateFormat' => 'yyyy-mm-dd'],
			[['dni'], 'unique'],
			[['id'], 'exist', 'targetClass' => \common\models\Info::className(), 'targetAttribute' => ['id' => 'id']]        
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
     * Gets query for [[common\models\Info]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getInfo()
    {
        return $this->hasOne(\common\models\Info::className(), ['id' => 'id']);
    }
}