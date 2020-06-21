<?php
namespace base\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "base__user_activity".
 *
 * Columns:
* @property integer $id  
* @property integer $ipv4  
* @property string $url  
* @property string|null $last_url  
* @property string|null $post  
* @property float|null $time_sql  
* @property float|null $time_php  
* @property float|null $time_exe  
* @property float|null $memory_kb  
* @property string $created_at  
* @property integer $base__user__id  
   
 *
 * Relations:
 * @property \base\models\User $user
 */
class UserActivity extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'base__user_activity';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['ipv4','url','base__user__id'], 'required'],
			[['id','ipv4'], 'is', 'type' => "int",'unsigned' => true],
			[['time_sql','time_exe','memory_kb'], 'is', 'type' => "float",'size' => "7, 3",'unsigned' => true],
			[['time_php'], 'is', 'type' => "float",'size' => "7, 3"],
			[['base__user__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['url','last_url'], 'string', 'max' => 255],
			[['created_at'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['created_at'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
			[['base__user__id'], 'exist', 'targetClass' => \base\models\User::className(),'targetAttribute' => ['base__user__id' => id]]        
        ];
    }

    /**
     * Gets query for [[base\models\User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(\base\models\User::className(), ['id' => 'base__user__id']);
    }
}