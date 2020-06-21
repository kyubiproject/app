<?php
namespace tours\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "tours_r_includes".
 *
 * Columns:
* @property integer $tours_id  
* @property integer $tours_includes_id  
* @property integer $tours_includes_types_id  
   
 *
 * Relations:
 * @property \tours\models\Includes $includes
 * @property \tours\models\IncludesTypes $includesTypes
 * @property \tours\models\Tours $tours
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
			[['tours_id','tours_includes_id','tours_includes_types_id'], 'required'],
			[['tours_id','tours_includes_id','tours_includes_types_id'], 'is', 'type' => "int"],
			[{'{\'targetAttribute\':[\'tours_id\',\'tours_includes_id\']}':'tours_includes_types_id'}, 'unique'],
			[['tours_id'], 'exist', 'targetClass' => \tours\models\Tours::className(),'targetAttribute' => ['tours_id' => id]],
			[['tours_includes_id'], 'exist', 'targetClass' => \tours\models\Includes::className(),'targetAttribute' => ['tours_includes_id' => id]],
			[['tours_includes_types_id'], 'exist', 'targetClass' => \tours\models\IncludesTypes::className(),'targetAttribute' => ['tours_includes_types_id' => id]]        
        ];
    }

    /**
     * Gets query for [[tours\models\Includes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIncludes()
    {
        return $this->hasOne(\tours\models\Includes::className(), ['id' => 'tours_includes_id']);
    }

    /**
     * Gets query for [[tours\models\IncludesTypes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIncludesTypes()
    {
        return $this->hasOne(\tours\models\IncludesTypes::className(), ['id' => 'tours_includes_types_id']);
    }

    /**
     * Gets query for [[tours\models\Tours]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasOne(\tours\models\Tours::className(), ['id' => 'tours_id']);
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