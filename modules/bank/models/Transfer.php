<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__transfer".
 *
 * Columns:
* @property integer $id  
* @property string $ref  
* @property string $date  
* @property integer $bank__account__id  
   
 *
 * Relations:
 * @property \bank\models\Account $account
 * @property \bank\models\Transaction $transaction
 */
class Transfer extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__transfer';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','ref','bank__account__id'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['bank__account__id'], 'is', 'type' => "smallint"],
			[['ref'], 'string', 'max' => 20],
			[['date'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['date'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
			[['id'], 'exist', 'targetClass' => \bank\models\Transaction::className(),'targetAttribute' => ['id' => id]],
			[['id'], 'exist', 'targetClass' => \bank\models\Account::className(),'targetAttribute' => ['id' => id]]        
        ];
    }

    /**
     * Gets query for [[bank\models\Account]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAccount()
    {
        return $this->hasOne(\bank\models\Account::className(), ['id' => 'id']);
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