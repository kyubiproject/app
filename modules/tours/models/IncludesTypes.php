<?php
namespace tours\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "tours_includes_types".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $description  
   
 *
 * Relations:
 * @property \tours\models\RIncludes[] $rIncludes
 */
class IncludesTypes extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_includes_types';
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
			[['id'], 'is', 'type' => "int"],
			[['name'], 'string', 'max' => 100]        
        ];
    }

    /**
     * Gets query for [[tours\models\RIncludes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRIncludes()
    {
        return $this->hasMany(\tours\models\RIncludes::className(), ['tours_includes_types_id' => 'id']);
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