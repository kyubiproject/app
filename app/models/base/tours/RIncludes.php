<?php
namespace app\models\base\tours;

/**
 * This is the model class for table "tours_r_includes".
 *
 * Columns:
* @property integer $tours_id  
* @property integer $tours_includes_id  
* @property integer $tours_includes_types_id  
 */
class RIncludes extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_r_includes';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tours_id', 'tours_includes_id', 'tours_includes_types_id'], 'required'],
			[['tours_id', 'tours_includes_id'], 'unique', 'targetAttribute' => ['tours_id', 'tours_includes_id']],
			[['tours_id'], 'exist', 'targetClass' => Tours::className(), 'targetAttribute' => ['tours_id' => 'id']],
			[['tours_includes_id'], 'exist', 'targetClass' => Includes::className(), 'targetAttribute' => ['tours_includes_id' => 'id']],
			[['tours_includes_types_id'], 'exist', 'targetClass' => IncludesTypes::className(), 'targetAttribute' => ['tours_includes_types_id' => 'id']]        
        ];
    }
    
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:getDb()
     */
    public static function getDb()
    {
        return app('viajes');
    }
}