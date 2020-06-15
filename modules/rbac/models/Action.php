<?php
namespace rbac\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rbac_action".
 *
 * Columns:
* @property integer $id  
* @property string $name_ID  
* @property string $name  
* @property boolean $is_active {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
* @property integer $rbac_controller__id  
   
 *
 * Relations:
 * @property \rbac\models\Controller $controller
 */
class Action extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rbac_action';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name_ID','name','is_active','rbac_controller__id'], 'required'],
			[['id'], 'is', 'type' => 'smallint', 'unsigned' => true],
			[['rbac_controller__id'], 'is', 'type' => 'int'],
			[['name_ID'], 'string', 'max' => 50],
			[['name'], 'string', 'max' => 100],
			[['is_active'], 'boolean'],
			[['rbac_controller__id'], 'exist', 'targetClass' => \rbac\models\Controller::className(), 'targetAttribute' => ['rbac_controller__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[rbac\models\Controller]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getController()
    {
        return $this->hasOne(\rbac\models\Controller::className(), ['id' => 'rbac_controller__id']);
    }
}