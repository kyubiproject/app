<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__moment".
 *
 * Columns:
* @property integer $id  
* @property string|null $code  
* @property string $type  
* @property string|null $date  
* @property string|null $note  
* @property integer|null $bexe__moment__id  
* @property string|null $created_at  
* @property string|null $status  
   
 *
 * Relations:
 * @property \bexe\models\Caused $caused
 * @property \bexe\models\Compromise $compromise
 * @property \bexe\models\Moment $moment
 * @property \bexe\models\MomentBalanceLog[] $momentBalanceLogs
 * @property \bexe\models\MomentBalance[] $momentBalances
 * @property \bexe\models\Moment[] $moments
 * @property \buy\models\Order[] $orders
 * @property \bexe\models\Paid $paid
 * @property \bank\models\TransactionMoment[] $transactionMoments
 * @property \bank\models\Transaction[] $transactions
 */
class Moment extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__moment';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['type'], 'required'],
			[['id','bexe__moment__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['code'], 'string', 'max' => 8],
			[['type'], 'range', 'range' => ['CERTIFICATE', 'COMPROMISE', 'CAUSED', 'PAID', 'ADJUST'],'strict' => true],
			[['status'], 'range', 'range' => ['LOCK', 'CANCEL', 'COMPLETE'],'strict' => true],
			[['date'], 'type', 'type' => "date",'dateFormat' => "yyyy-mm-dd"],
			[['created_at'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['created_at'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
			[['code'], 'unique'],
			[['bexe__moment__id'], 'exist', 'targetClass' => \bexe\models\Moment::className(),'targetAttribute' => ['bexe__moment__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bexe\models\Caused]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCaused()
    {
        return $this->hasOne(\bexe\models\Caused::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bexe\models\Compromise]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCompromise()
    {
        return $this->hasOne(\bexe\models\Compromise::className(), ['id' => 'id']);
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
     * Gets query for [[bexe\models\MomentBalanceLog]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMomentBalanceLogs()
    {
        return $this->hasMany(\bexe\models\MomentBalanceLog::className(), ['bexe__moment__id' => 'id']);
    }

    /**
     * Gets query for [[bexe\models\MomentBalance]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMomentBalances()
    {
        return $this->hasMany(\bexe\models\MomentBalance::className(), ['bexe__moment__id' => 'id']);
    }

    /**
     * Gets query for [[bexe\models\Moment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoments()
    {
        return $this->hasMany(\bexe\models\Moment::className(), ['bexe__moment__id' => 'id']);
    }

    /**
     * Gets query for [[buy\models\Order]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(\buy\models\Order::className(), ['bexe__moment__id' => 'id']);
    }

    /**
     * Gets query for [[bexe\models\Paid]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPaid()
    {
        return $this->hasOne(\bexe\models\Paid::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\TransactionMoment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransactionMoments()
    {
        return $this->hasMany(\bank\models\TransactionMoment::className(), ['bexe__moment__id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\Transaction]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransactions()
    {
        return $this->hasMany(\bank\models\Transaction::className(), ['bexe__moment__id' => 'id']);
    }
}