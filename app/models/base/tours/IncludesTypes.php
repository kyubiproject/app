<?php
namespace app\models\base\tours;

/**
 * This is the model class for table "tours_includes_types".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $description  
 */
class IncludesTypes extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_includes_types';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name'], 'required'],
			[['name'], 'string', 'max' => 100]        
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