<?php
namespace tours\models;

use kyubi\base\ActiveRecord;

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
 * @property IncludesTypes[] $includesTypes
 * @property RIncludes[] $rIncludes
 * @property Tours[] $tours
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
			[['id'], 'is', 'type' => 'int'],
			[['name'], 'string', 'max' => 100],
			[['description', 'image'], 'string', 'max' => 255]        
        ];
    }

    /**
     * Gets query for [[IncludesTypes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIncludesTypes()
    {
        return $this->hasMany(IncludesTypes::className(), ['id' => 'tours_includes_types_id'])->via('rIncludes');
    }

    /**
     * Gets query for [[RIncludes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRIncludes()
    {
        return $this->hasMany(RIncludes::className(), ['tours_includes_id' => 'id']);
    }

    /**
     * Gets query for [[RIncludes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasMany(RIncludes::className(), ['tours_includes_id' => 'id']);
    }
}