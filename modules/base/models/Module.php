<?php
namespace base\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "base__module".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string $label  
* @property string|null $icon  
* @property integer|null $order  
* @property string|null $note  
* @property boolean|null $is_active  
   
 *
 * Relations:
 * @property \base\models\Controller[] $controllers
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
        return 'base__module';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name','label'], 'required'],
			[['id','order'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['name'], 'string', 'max' => 16],
			[['label'], 'string', 'max' => 64],
			[['icon'], 'string', 'max' => 32],
			[['is_active'], 'boolean'],
			[['is_active'], 'default', 'value' => 1],
			[['name'], 'unique']        
        ];
    }

    /**
     * Gets query for [[base\models\Controller]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getControllers()
    {
        return $this->hasMany(\base\models\Controller::className(), ['base__module__id' => 'id']);
    }
}