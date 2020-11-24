<?php
namespace app\models\base\tours;

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
 */
class Dates extends \kyubi\base\ActiveRecord
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
			[['start_date', 'end_date'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['month_id'], 'exist', 'targetClass' => \app\models\base\common\Months::className(), 'targetAttribute' => ['month_id' => 'id']],
			[['weekday_id'], 'exist', 'targetClass' => \app\models\base\common\Weekdays::className(), 'targetAttribute' => ['weekday_id' => 'id']],
			[['tour_id'], 'exist', 'targetClass' => Tours::className(), 'targetAttribute' => ['tour_id' => 'id']],
			[['status_id'], 'exist', 'targetClass' => DatesStatus::className(), 'targetAttribute' => ['status_id' => 'id']]        
        ];
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