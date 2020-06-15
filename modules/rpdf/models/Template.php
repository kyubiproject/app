<?php
namespace rpdf\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rpdf__template".
 *
 * Columns:
* @property integer $id  
* @property string $name {"rules":["unique"]} 
* @property string $template  
* @property integer $created_by  
* @property string $created_at  
 */
class Template extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rpdf__template';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name','template','created_by'], 'required'],
			[['id','created_by'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 100],
			[['created_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]]        
        ];
    }
}