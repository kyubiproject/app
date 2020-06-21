<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__transaction_type".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $type  
* @property string $movement  
* @property string|null $note  
* @property boolean $is_active  
   
 *
 * Relations:
 * @property \bank\models\FeeTransacctionType[] $feeTransacctionTypes
 * @property \bank\models\Fee[] $fees
 * @property \bank\models\Transaction[] $transactions
 */
class TransactionType extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__transaction_type';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name','movement'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['name'], 'string', 'max' => 64],
			[['type'], 'range', 'range' => ['DEPOSIT', 'CREDIT', 'TRANSFER', 'CHECK', 'POS', 'ATM', 'TAX', 'INTEREST', 'CHARGE', 'OTHER'],'strict' => true],
			[['movement'], 'range', 'range' => ['INCOME', 'OUTCOME'],'strict' => true],
			[['is_active'], 'boolean'],
			[['is_active'], 'default', 'value' => 1]        
        ];
    }

    /**
     * Gets query for [[bank\models\FeeTransacctionType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFeeTransacctionTypes()
    {
        return $this->hasMany(\bank\models\FeeTransacctionType::className(), ['bank__transacction_type__id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\Fee]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFees()
    {
        return $this->hasMany(\bank\models\Fee::className(), ['id' => 'bank__fee__id'])->via('feeTransacctionTypes');
    }

    /**
     * Gets query for [[bank\models\Transaction]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransactions()
    {
        return $this->hasMany(\bank\models\Transaction::className(), ['bank__transaction_type__id' => 'id']);
    }
}