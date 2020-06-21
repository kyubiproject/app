<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__fee_transacction_type".
 *
 * Columns:
* @property integer $bank__fee__id  
* @property integer $bank__transacction_type__id  
   
 *
 * Relations:
 * @property \bank\models\Fee $fee
 * @property \bank\models\TransactionType $transactionType
 */
class FeeTransacctionType extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__fee_transacction_type';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['bank__fee__id','bank__transacction_type__id'], 'required'],
			[['bank__fee__id','bank__transacction_type__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[{'{\'targetAttribute\':[\'bank__fee__id\',\'bank__transacction_type__id\']}':'bank__transacction_type__id'}, 'unique'],
			[['bank__fee__id'], 'exist', 'targetClass' => \bank\models\Fee::className(),'targetAttribute' => ['bank__fee__id' => id]],
			[['bank__transacction_type__id'], 'exist', 'targetClass' => \bank\models\TransactionType::className(),'targetAttribute' => ['bank__transacction_type__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bank\models\Fee]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFee()
    {
        return $this->hasOne(\bank\models\Fee::className(), ['id' => 'bank__fee__id']);
    }

    /**
     * Gets query for [[bank\models\TransactionType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransactionType()
    {
        return $this->hasOne(\bank\models\TransactionType::className(), ['id' => 'bank__transacction_type__id']);
    }
}