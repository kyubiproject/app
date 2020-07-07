<?php
namespace tours\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "tours_dates".
 *
 * Columns:
* @property integer $id  
* @property integer $tour_id  
* @property integer $status_id  
* @property string|null $start_date  
* @property string|null $end_date  
* @property integer|null $weekday_id  
* @property integer|null $month_id  
   
 *
 * Relations:
 * @property DatesStatus $datesStatus
 * @property \common\models\Months $months
 * @property Tours $tours
 * @property \common\models\Weekdays $weekdays
 */
class Dates extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_dates';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tour_id', 'status_id'], 'required'],
			[['id', 'tour_id', 'status_id', 'weekday_id', 'month_id'], 'is', 'type' => 'int'],
			[['start_date', 'end_date'], 'type', 'type' => 'date', 'dateFormat' => 'yyyy-mm-dd'],
			[['month_id'], 'exist', 'targetClass' => \common\models\Months::className(), 'targetAttribute' => ['month_id' => 'id']],
			[['weekday_id'], 'exist', 'targetClass' => \common\models\Weekdays::className(), 'targetAttribute' => ['weekday_id' => 'id']],
			[['tour_id'], 'exist', 'targetClass' => Tours::className(), 'targetAttribute' => ['tour_id' => 'id']],
			[['status_id'], 'exist', 'targetClass' => DatesStatus::className(), 'targetAttribute' => ['status_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[DatesStatus]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDatesStatus()
    {
        return $this->hasOne(DatesStatus::className(), ['id' => 'status_id']);
    }

    /**
     * Gets query for [[\common\models\Months]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMonths()
    {
        return $this->hasOne(\common\models\Months::className(), ['id' => 'month_id']);
    }

    /**
     * Gets query for [[Tours]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTours()
    {
        return $this->hasOne(Tours::className(), ['id' => 'tour_id']);
    }

    /**
     * Gets query for [[Tours]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWeekdays()
    {
        return $this->hasOne(Tours::className(), ['id' => 'tour_id']);
    }
}