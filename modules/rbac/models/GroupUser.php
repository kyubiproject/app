<?php
namespace rbac\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rbac_group_user".
 *
 * Columns:
* @property integer $rbac_group__id  
* @property integer $rbac_user__id  
   
 *
 * Relations:
 * @property \rbac\models\Group $group
 * @property \rbac\models\User $user
 */
class GroupUser extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rbac_group_user';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['rbac_group__id','rbac_user__id'], 'required'],
			[['rbac_group__id','rbac_user__id'], 'is', 'type' => 'int'],
			[{'{\'targetAttribute\':[\'rbac_group__id\',\'rbac_user__id\']}':'rbac_user__id'}, 'unique'],
			[['rbac_group__id'], 'exist', 'targetClass' => \rbac\models\Group::className(), 'targetAttribute' => ['rbac_group__id' => 'id']],
			[['rbac_user__id'], 'exist', 'targetClass' => \rbac\models\User::className(), 'targetAttribute' => ['rbac_user__id' => 'id']]        
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