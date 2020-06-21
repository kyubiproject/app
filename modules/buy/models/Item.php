<?php
namespace buy\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "buy__item".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $category  
* @property string|null $measure  
 */
class Item extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'buy__item';
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
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['name'], 'string', 'max' => 128],
			[['category'], 'string', 'max' => 64],
			[['measure'], 'string', 'max' => 32]        
        ];
    }
}