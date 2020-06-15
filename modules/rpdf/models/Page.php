<?php
namespace rpdf\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "rpdf__page".
 *
 * Columns:
* @property integer $id  
* @property string $name {"rules":["unique"]} 
* @property double $width  
* @property double $height  
   
 *
 * Relations:
 * @property \rpdf\models\Format[] $formats
 */
class Page extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'rpdf__page';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['name','width','height'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['width','height'], 'is', 'type' => 'decimal', 'size' => '5, 2'],
			[['name'], 'string', 'max' => 50]        
        ];
    }

    /**
     * Gets query for [[rpdf\models\Format]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFormats()
    {
        return $this->hasMany(\rpdf\models\Format::className(), ['rpdf_page__id' => 'id']);
    }
}