<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__check".
 *
 * Columns:
* @property integer $id  
* @property integer $number  
* @property string $to  
* @property string $date  
* @property integer|null $valid  
   
 *
 * Relations:
 * @property \bank\models\Transaction $transaction
 */
class Check extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__check';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','number','to','date'], 'required'],
			[['id','number'], 'is', 'type' => "smallint",'unsigned' => true],
			[['valid'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['to'], 'string', 'max' => 128],
			[['date'], 'type', 'type' => "date",'dateFormat' => "yyyy-mm-dd"],
			[['id'], 'exist', 'targetClass' => \bank\models\Transaction::className(),'targetAttribute' => ['id' => id]]        
        ];
    }

    /**
     * Gets query for [[bank\models\Transaction]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransaction()
    {
        return $this->hasOne(\bank\models\Transaction::className(), ['id' => 'id']);
    }
}