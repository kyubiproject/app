<?php
namespace app\models\base\tours;

/**
 * This is the model class for table "tours_includes".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $description  
* @property string|null $image  
 */
class Includes extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_includes';
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
			[['name'], 'string', 'max' => 100],
			[['description', 'image'], 'string', 'max' => 255]        
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