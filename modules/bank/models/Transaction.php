<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__transaction".
 *
 * Columns:
* @property integer $id  
* @property string|null $ref  
* @property string $date  
* @property double $amount  
* @property string|null $status  
* @property integer $bank__account__id  
* @property integer|null $bank__transaction__id  
* @property integer $bank__transaction_type__id  
* @property integer|null $bexe__moment__id  
   
 *
 * Relations:
 * @property \bank\models\Account $account
 * @property \bank\models\Check $check
 * @property \bank\models\Credit $credit
 * @property \bexe\models\Moment $moment
 * @property \bexe\models\Moment[] $moments
 * @property \bank\models\Transaction $transaction
 * @property \bank\models\TransactionDocument $transactionDocument
 * @property \bank\models\TransactionMoment[] $transactionMoments
 * @property \bank\models\TransactionType $transactionType
 * @property \bank\models\Transaction[] $transactions
 * @property \bank\models\Transfer $transfer
 */
class Transaction extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__transaction';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['amount','bank__account__id','bank__transaction_type__id'], 'required'],
			[['id','bank__account__id','bank__transaction__id','bank__transaction_type__id','bexe__moment__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['amount'], 'is', 'type' => "double",'size' => "15, 2"],
			[['ref'], 'string', 'max' => 20],
			[['date'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['date'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
			[['status'], 'range', 'range' => ['OK', 'REJECT', 'CANCEL', 'WAIT'],'strict' => true],
			[{'{\'targetAttribute\':[\'amount\',\'ref\']}':'bexe__moment__id'}, 'unique'],
			[['bank__account__id'], 'exist', 'targetClass' => \bank\models\Account::className(),'targetAttribute' => ['bank__account__id' => id]],
			[['bank__transaction__id'], 'exist', 'targetClass' => \bank\models\Transaction::className(),'targetAttribute' => ['bank__transaction__id' => id]],
			[['bank__transaction_type__id'], 'exist', 'targetClass' => \bank\models\TransactionType::className(),'targetAttribute' => ['bank__transaction_type__id' => id]],
			[['bexe__moment__id'], 'exist', 'targetClass' => \bexe\models\Moment::className(),'targetAttribute' => ['bexe__moment__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bank\models\Account]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAccount()
    {
        return $this->hasOne(\bank\models\Account::className(), ['id' => 'bank__account__id']);
    }

    /**
     * Gets query for [[bank\models\Check]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCheck()
    {
        return $this->hasOne(\bank\models\Check::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\Credit]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCredit()
    {
        return $this->hasOne(\bank\models\Credit::className(), ['id' => 'id']);
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
     * Gets query for [[bexe\models\Moment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoments()
    {
        return $this->hasMany(\bexe\models\Moment::className(), ['id' => 'bexe__moment__id'])->via('transactionMoments');
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

    /**
     * Gets query for [[bank\models\TransactionDocument]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransactionDocument()
    {
        return $this->hasOne(\bank\models\TransactionDocument::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\TransactionMoment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransactionMoments()
    {
        return $this->hasMany(\bank\models\TransactionMoment::className(), ['bank__transaction__id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\TransactionType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransactionType()
    {
        return $this->hasOne(\bank\models\TransactionType::className(), ['id' => 'bank__transaction_type__id']);
    }

    /**
     * Gets query for [[bank\models\Transaction]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransactions()
    {
        return $this->hasMany(\bank\models\Transaction::className(), ['bank__transaction__id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\Transfer]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransfer()
    {
        return $this->hasOne(\bank\models\Transfer::className(), ['id' => 'id']);
    }
}