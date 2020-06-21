<?php
namespace tours\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "tours_r_categories".
 *
 * Columns:
* @property integer $tours_id  
* @property integer $tours_categories_id  
   
 *
 * Relations:
 * @property \tours\models\Categories $categories
 * @property \tours\models\Tours $tours
 */
class RCategories extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_r_categories';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tours_id','tours_categories_id'], 'required'],
			[['tours_id','tours_categories_id'], 'is', 'type' => "int"],
			[{'{\'targetAttribute\':[\'tours_categories_id\',\'tours_id\']}':'tours_categories_id'}, 'unique'],
			[['tours_id'], 'exist', 'targetClass' => \tours\models\Tours::className(),'targetAttribute' => ['tours_id' => id]],
			[['tours_categories_id'], 'exist', 'targetClass' => \tours\models\Categories::className(),'targetAttribute' => ['tours_categories_id' => id]]        
        ];
    }

    /**
     * Gets query for [[tours\models\Categories]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategories()
    {
        return $this->hasOne(\tours\models\Categories::className(), ['id' => 'tours_categories_id']);
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