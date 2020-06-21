<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__paid".
 *
 * Columns:
* @property integer $id  
* @property string|null $dni  
* @property string|null $provider  
* @property string|null $account  
* @property string|null $number  
* @property string|null $issued_date  
   
 *
 * Relations:
 * @property \bexe\models\Moment $moment
 */
class Paid extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__paid';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['dni'], 'string', 'max' => 12],
			[['provider'], 'string', 'max' => 128],
			[['account'], 'string', 'max' => 24],
			[['number'], 'string', 'max' => 16],
			[['issued_date'], 'type', 'type' => "date",'dateFormat' => "yyyy-mm-dd"],
			[['id'], 'exist', 'targetClass' => \bexe\models\Moment::className(),'targetAttribute' => ['id' => id]]        
        ];
    }

    /**
     * Gets query for [[bexe\models\Moment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoment()
    {
        return $this->hasOne(\bexe\models\Moment::className(), ['id' => 'id']);
    }
}