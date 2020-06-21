<?php
namespace base\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "base__controller".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $label  
* @property string|null $icon  
* @property integer|null $order  
* @property integer $base__module__id  
* @property boolean|null $is_active  
   
 *
 * Relations:
 * @property \base\models\Module $module
 * @property \base\models\Permission[] $permissions
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
        return 'base__controller';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name','base__module__id'], 'required'],
			[['id','order','base__module__id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['name','icon'], 'string', 'max' => 32],
			[['label'], 'string', 'max' => 64],
			[['is_active'], 'boolean'],
			[['is_active'], 'default', 'value' => 1],
			[{'{\'targetAttribute\':[\'base__module__id\',\'name\']}':'is_active'}, 'unique'],
			[['base__module__id'], 'exist', 'targetClass' => \base\models\Module::className(),'targetAttribute' => ['base__module__id' => id]]        
        ];
    }

    /**
     * Gets query for [[base\models\Module]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModule()
    {
        return $this->hasOne(\base\models\Module::className(), ['id' => 'base__module__id']);
    }

    /**
     * Gets query for [[base\models\Permission]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPermissions()
    {
        return $this->hasMany(\base\models\Permission::className(), ['base__controller__id' => 'id']);
    }
}