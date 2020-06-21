<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__deposit".
 *
 * Columns:
* @property integer $id  
* @property integer $voucher  
* @property string $from  
* @property string $date  
 */
class Deposit extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__deposit';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','voucher','from','date'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['voucher'], 'is', 'type' => "mediumint",'unsigned' => true],
			[['from'], 'string', 'max' => 128],
			[['date'], 'type', 'type' => "date",'dateFormat' => "yyyy-mm-dd"]        
        ];
    }
}