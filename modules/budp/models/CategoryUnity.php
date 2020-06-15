<?php
namespace budp\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "budp_category_unity".
 *
 * Columns:
* @property integer $budp_category__id  
* @property integer $budp_unity__id  
   
 *
 * Relations:
 * @property \budp\models\Category $category
 * @property \budp\models\Unity $unity
 */
class CategoryUnity extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'budp_category_unity';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['budp_category__id','budp_unity__id'], 'required'],
			[['budp_category__id','budp_unity__id'], 'is', 'type' => 'int'],
			[{'{\'targetAttribute\':[\'budp_category__id\',\'budp_unity__id\']}':'budp_unity__id'}, 'unique'],
			[['budp_category__id'], 'exist', 'targetClass' => \budp\models\Category::className(), 'targetAttribute' => ['budp_category__id' => 'id']],
			[['budp_unity__id'], 'exist', 'targetClass' => \budp\models\Unity::className(), 'targetAttribute' => ['budp_unity__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[budp\models\Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(\budp\models\Category::className(), ['id' => 'budp_category__id']);
    }

    /**
     * Gets query for [[budp\models\Unity]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUnity()
    {
        return $this->hasOne(\budp\models\Unity::className(), ['id' => 'budp_unity__id']);
    }
}