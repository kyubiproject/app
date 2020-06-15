<?php
namespace budf\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "budf_ingress".
 *
 * Columns:
* @property integer $id  
* @property integer $year {"rules":["uniqueMix"]} 
* @property integer $budp_sorter__id {"rules":["uniqueMix"]} 
   
 *
 * Relations:
 * @property \budf\models\Budget $budget
 * @property \budp\models\Sorter $sorter
 */
class Ingress extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'budf_ingress';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','year','budp_sorter__id'], 'required'],
			[['id','budp_sorter__id'], 'is', 'type' => 'int'],
			[['year'], 'is', 'type' => 'year'],
			[{'{\'targetAttribute\':[\'year\',\'budp_sorter__id\']}':'budp_sorter__id'}, 'unique'],
			[['id'], 'exist', 'targetClass' => \budf\models\Budget::className(), 'targetAttribute' => ['id' => 'id']],
			[['budp_sorter__id'], 'exist', 'targetClass' => \budp\models\Sorter::className(), 'targetAttribute' => ['budp_sorter__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[budf\models\Budget]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBudget()
    {
        return $this->hasOne(\budf\models\Budget::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[budp\models\Sorter]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSorter()
    {
        return $this->hasOne(\budp\models\Sorter::className(), ['id' => 'budp_sorter__id']);
    }
}