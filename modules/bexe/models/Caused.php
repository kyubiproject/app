<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__caused".
 *
 * Columns:
* @property integer $id  
* @property string|null $invoice  
* @property string|null $control  
* @property string|null $issued_date  
   
 *
 * Relations:
 * @property \bexe\models\Moment $moment
 */
class Caused extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__caused';
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
			[['invoice','control'], 'string', 'max' => 10],
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