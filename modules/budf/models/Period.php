<?php
namespace budf\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "budf_period".
 *
 * Columns:
* @property integer $id  
* @property string $start_date  
* @property string $end_date  
* @property double $assigned_amount  
* @property integer $budf_budget__id  
   
 *
 * Relations:
 * @property \budf\models\Budget $budget
 */
class Period extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'budf_period';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['start_date','end_date','assigned_amount','budf_budget__id'], 'required'],
			[['id','budf_budget__id'], 'is', 'type' => 'int'],
			[['assigned_amount'], 'is', 'type' => 'decimal', 'size' => '20, 2'],
			[['start_date','end_date'], 'type', 'type' => 'date', 'dateFormat' => 'yyyy-mm-dd'],
			[['budf_budget__id'], 'exist', 'targetClass' => \budf\models\Budget::className(), 'targetAttribute' => ['budf_budget__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[budf\models\Budget]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBudget()
    {
        return $this->hasOne(\budf\models\Budget::className(), ['id' => 'budf_budget__id']);
    }
}