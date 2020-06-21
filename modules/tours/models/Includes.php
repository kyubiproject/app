<?php
namespace tours\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "tours_includes".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $description  
* @property string|null $image  
   
 *
 * Relations:
 * @property \tours\models\IncludesTypes[] $includesTypes
 * @property \tours\models\RIncludes[] $rIncludes
 * @property \tours\models\Tours[] $tours
 */
class Includes extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_includes';
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
			[['name'], 'string', 'max' => 100],
			[['description','image'], 'string', 'max' => 255]        
        ];
    }

    /**
     * Gets query for [[tours\models\IncludesTypes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIncludesTypes()
    {
        return $this->hasMany(\tours\models\IncludesTypes::className(), ['id' => 'tours_includes_types_id'])->via('rIncludes');
    }

    /**
     * Gets query for [[tours\models\RIncludes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRIncludes()
    {
        return $this->hasMany(\tours\models\RIncludes::className(), ['tours_includes_id' => 'id']);
    }

    /**
     * Gets query for [[tours\models\Tours]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasMany(\tours\models\Tours::className(), ['id' => 'tours_id'])->via('rIncludes');
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