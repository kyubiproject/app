<?php
namespace base\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "base__permission".
 *
 * Columns:
* @property integer $id  
* @property integer $base__role__id  
* @property integer $base__controller__id  
* @property string|null $actions  
   
 *
 * Relations:
 * @property \base\models\Controller $controller
 * @property \base\models\Role $role
 */
class Permission extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'base__permission';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['base__role__id','base__controller__id'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['base__role__id','base__controller__id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['actions'], 'string', 'max' => 1000],
			[{'{\'targetAttribute\':[\'base__controller__id\',\'base__role__id\']}':'actions'}, 'unique'],
			[['base__role__id'], 'exist', 'targetClass' => \base\models\Role::className(),'targetAttribute' => ['base__role__id' => id]],
			[['base__controller__id'], 'exist', 'targetClass' => \base\models\Controller::className(),'targetAttribute' => ['base__controller__id' => id]]        
        ];
    }

    /**
     * Gets query for [[base\models\Controller]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getController()
    {
        return $this->hasOne(\base\models\Controller::className(), ['id' => 'base__controller__id']);
    }

    /**
     * Gets query for [[base\models\Role]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(\base\models\Role::className(), ['id' => 'base__role__id']);
    }
}