<?php
namespace backend\models\base;

/**
 * This is the model class for table "backend__permission".
 *
 * Columns:
* @property integer $profile__id  
* @property string $route  
* @property string|null $actions  
 */
class Permission extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'backend__permission';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['profile__id', 'route'], 'required'],
			[['route'], 'string', 'max' => 120],
			[['actions'], 'string', 'max' => 255],
			[['profile__id', 'route'], 'unique', 'targetAttribute' => ['profile__id', 'route']],
			[['profile__id'], 'exist', 'targetClass' => Profile::className(), 'targetAttribute' => ['profile__id' => 'id']]        
        ];
    }
}