<?php
namespace rbac\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rbac_module".
 *
 * Columns:
* @property integer $id  
* @property string $name_ID {"rules":["unique"]} 
* @property string $name  
* @property string|null $note  
* @property integer|null $position {"rules":["min:1"]} 
* @property boolean $is_active {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
   
 *
 * Relations:
 * @property \rbac\models\Controller[] $controllers
 */
class Module extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rbac_module';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name_ID','name','is_active'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['position'], 'is', 'type' => 'tinyint'],
			[['name_ID'], 'string', 'max' => 50],
			[['name'], 'string', 'max' => 100],
			[['note'], 'string', 'max' => 500],
			[['is_active'], 'boolean'],
			[['name_ID'], 'unique']        
        ];
    }

    /**
     * Gets query for [[rbac\models\Controller]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getControllers()
    {
        return $this->hasMany(\rbac\models\Controller::className(), ['rbac_module__id' => 'id']);
    }
}