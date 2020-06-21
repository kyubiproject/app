<?php
namespace bcon\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bcon__account".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $note  
   
 *
 * Relations:
 * @property \bcon\models\Sorter $sorter
 */
class Account extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bcon__account';
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