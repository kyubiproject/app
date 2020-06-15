<?php
namespace rpdf\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rpdf__format".
 *
 * Columns:
* @property integer $id  
* @property string $name {"rules":["unique"]} 
* @property string $title  
* @property string|null $note  
* @property string $template  
* @property integer $rows  
* @property string $route  
* @property boolean $is_active {"list":{"es":["No","Si"]}} 
* @property integer $created_by  
* @property string $created_at  
* @property integer $rpdf_page__id  
   
 *
 * Relations:
 * @property \rpdf\models\Page $page
 */
class Format extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rpdf__format';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name','title','template','rows','route','is_active','created_by','rpdf_page__id'], 'required'],
			[['id','created_by','rpdf_page__id'], 'is', 'type' => 'int'],
			[['rows'], 'is', 'type' => 'tinyint'],
			[['name'], 'string', 'max' => 50],
			[['title','route'], 'string', 'max' => 100],
			[['note'], 'string', 'max' => 500],
			[['is_active'], 'boolean'],
			[['created_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['rpdf_page__id'], 'exist', 'targetClass' => \rpdf\models\Page::className(), 'targetAttribute' => ['rpdf_page__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[rpdf\models\Page]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPage()
    {
        return $this->hasOne(\rpdf\models\Page::className(), ['id' => 'rpdf_page__id']);
    }
}