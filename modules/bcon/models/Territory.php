<?php
namespace bcon\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bcon__territory".
 *
 * Columns:
* @property integer $id  
* @property string $name  
   
 *
 * Relations:
 * @property \bcon\models\Sorter $sorter
 */
class Territory extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bcon__territory';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','name'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['name'], 'string', 'max' => 255],
			[['id'], 'exist', 'targetClass' => \bcon\models\Sorter::className(),'targetAttribute' => ['id' => id]]        
        ];
    }

    /**
     * Gets query for [[bcon\models\Sorter]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSorter()
    {
        return $this->hasOne(\bcon\models\Sorter::className(), ['id' => 'id']);
    }
}