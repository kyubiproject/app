<?php
namespace tours\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "tours_r_includes".
 *
 * Columns:
* @property integer $tours_id  
* @property integer $tours_includes_id  
* @property integer $tours_includes_types_id  
   
 *
 * Relations:
 * @property Includes $includes
 * @property IncludesTypes $includesTypes
 * @property Tours $tours
 */
class RIncludes extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_r_includes';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tours_id', 'tours_includes_id', 'tours_includes_types_id'], 'required'],
			[['tours_id', 'tours_includes_id', 'tours_includes_types_id'], 'is', 'type' => 'int'],
			[['tours_id', 'tours_includes_id'], 'unique', 'targetAttribute' => ['tours_id', 'tours_includes_id']],
			[['tours_id'], 'exist', 'targetClass' => Tours::className(), 'targetAttribute' => ['tours_id' => 'id']],
			[['tours_includes_id'], 'exist', 'targetClass' => Includes::className(), 'targetAttribute' => ['tours_includes_id' => 'id']],
			[['tours_includes_types_id'], 'exist', 'targetClass' => IncludesTypes::className(), 'targetAttribute' => ['tours_includes_types_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Includes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIncludes()
    {
        return $this->hasOne(Includes::className(), ['id' => 'tours_includes_id']);
    }

    /**
     * Gets query for [[IncludesTypes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIncludesTypes()
    {
        return $this->hasOne(IncludesTypes::className(), ['id' => 'tours_includes_types_id']);
    }

    /**
     * Gets query for [[IncludesTypes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasOne(IncludesTypes::className(), ['id' => 'tours_includes_types_id']);
    }
}