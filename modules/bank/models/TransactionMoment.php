<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__transaction_moment".
 *
 * Columns:
* @property integer $bank__transaction__id  
* @property integer $bexe__moment__id  
   
 *
 * Relations:
 * @property \bexe\models\Moment $moment
 * @property \bank\models\Transaction $transaction
 */
class TransactionMoment extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__transaction_moment';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['bank__transaction__id','bexe__moment__id'], 'required'],
			[['bank__transaction__id','bexe__moment__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[{'{\'targetAttribute\':[\'bank__transaction__id\',\'bexe__moment__id\']}':'bexe__moment__id'}, 'unique'],
			[['bexe__moment__id'], 'exist', 'targetClass' => \bexe\models\Moment::className(),'targetAttribute' => ['bexe__moment__id' => id]],
			[['bank__transaction__id'], 'exist', 'targetClass' => \bank\models\Transaction::className(),'targetAttribute' => ['bank__transaction__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bexe\models\Moment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoment()
    {
        return $this->hasOne(\bexe\models\Moment::className(), ['id' => 'bexe__moment__id']);
    }

    /**
     * Gets query for [[bank\models\Transaction]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransaction()
    {
        return $this->hasOne(\bank\models\Transaction::className(), ['id' => 'bank__transaction__id']);
    }
}