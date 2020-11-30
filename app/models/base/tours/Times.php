<?php
namespace app\models\base\tours;

/**
 * This is the model class for table "tours_times".
 *
 * Columns:
* @property integer $id  
* @property integer $tours_id  
* @property string $time  
 */
class Times extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours_times';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tours_id', 'time'], 'required'],
			[['time'], 'date', 'type' => 'time', 'format' => 'hh:mm:ss'],
			[['tours_id'], 'exist', 'targetClass' => Tours::className(), 'targetAttribute' => ['tours_id' => 'id']]        
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