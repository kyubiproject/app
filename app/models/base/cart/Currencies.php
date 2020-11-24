<?php
namespace app\models\base\cart;

/**
 * This is the model class for table "cart_currencies".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string $code  
* @property boolean|null $enabled  
* @property double|null $conversion  
* @property integer|null $weight  
 */
class Currencies extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_currencies';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name', 'code'], 'required'],
			[['name'], 'string', 'max' => 100],
			[['code'], 'string', 'max' => 10],
			[['enabled'], 'boolean'],
			[['enabled', 'conversion'], 'default', 'value' => 1],
			[['weight'], 'default', 'value' => 0]        
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