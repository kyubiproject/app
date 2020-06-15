<?php
namespace rbac\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rbac_group_action".
 *
 * Columns:
* @property integer $rbac_group__id  
* @property integer $rbac_action__id  
   
 *
 * Relations:
 * @property \rbac\models\Group $group
 */
class GroupAction extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rbac_group_action';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['rbac_group__id','rbac_action__id'], 'required'],
			[['rbac_group__id'], 'is', 'type' => 'int'],
			[['rbac_action__id'], 'is', 'type' => 'smallint'],
			[{'{\'targetAttribute\':[\'rbac_group__id\',\'rbac_action__id\']}':'rbac_action__id'}, 'unique'],
			[['rbac_group__id'], 'exist', 'targetClass' => \rbac\models\Group::className(), 'targetAttribute' => ['rbac_group__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[rbac\models\Group]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGroup()
    {
        return $this->hasOne(\rbac\models\Group::className(), ['id' => 'rbac_group__id']);
    }
}