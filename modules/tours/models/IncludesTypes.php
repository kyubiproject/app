<?php
namespace tours\models;

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
			[['id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 100]        
        ];
    }
}