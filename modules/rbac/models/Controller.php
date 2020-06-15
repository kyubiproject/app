<?php
namespace rbac\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rbac_controller".
 *
 * Columns:
* @property integer $id  
* @property string $name_ID {"rules":["uniqueMix"]} 
* @property string $name  
* @property string|null $note  
* @property integer|null $position {"rules":["min:1"]} 
* @property boolean $is_active {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
* @property integer $rbac_module__id {"rules":["uniqueMix"]} 
   
 *
 * Relations:
 * @property \rbac\models\Action[] $actions
 * @property \rbac\models\Module $module
 */
class Controller extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rbac_controller';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name_ID','name','is_active','rbac_module__id'], 'required'],
			[['id','rbac_module__id'], 'is', 'type' => 'int'],
			[['position'], 'is', 'type' => 'tinyint'],
			[['name_ID'], 'string', 'max' => 50],
			[['name'], 'string', 'max' => 100],
			[['note'], 'string', 'max' => 500],
			[['is_active'], 'boolean'],
			[{'{\'targetAttribute\':[\'name_ID\',\'rbac_module__id\']}':'rbac_module__id'}, 'unique'],
			[['rbac_module__id'], 'exist', 'targetClass' => \rbac\models\Module::className(), 'targetAttribute' => ['rbac_module__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[rbac\models\Action]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getActions()
    {
        return $this->hasMany(\rbac\models\Action::className(), ['rbac_controller__id' => 'id']);
    }

    /**
     * Gets query for [[rbac\models\Module]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModule()
    {
        return $this->hasOne(\rbac\models\Module::className(), ['id' => 'rbac_module__id']);
    }
}