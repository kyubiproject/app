<?php
namespace transfers\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "transfers_configs".
 *
 * Columns:
* @property integer $id  
* @property boolean|null $show_regular_price  
* @property boolean|null $show_services  
 */
class Configs extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'transfers_configs';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[[], 'required'],
			[['id'], 'is', 'type' => "int"],
			[['show_regular_price','show_services'], 'boolean'],
			[['show_regular_price','show_services'], 'default', 'value' => 1]        
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