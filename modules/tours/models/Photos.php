<?php
namespace tours\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "tours_photos".
 *
 * Columns:
* @property integer $id  
* @property integer $tours_id  
* @property string|null $name  
* @property string|null $description  
* @property string $path  
* @property string|null $thumb  
   
 *
 * Relations:
 * @property Tours $tours
 */
class Photos extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_photos';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tours_id', 'path'], 'required'],
			[['id', 'tours_id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 100],
			[['path', 'thumb'], 'string', 'max' => 255],
			[['tours_id'], 'exist', 'targetClass' => Tours::className(), 'targetAttribute' => ['tours_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Tours]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasOne(Tours::className(), ['id' => 'tours_id']);
    }
}