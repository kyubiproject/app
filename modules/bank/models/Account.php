<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__account".
 *
 * Columns:
* @property integer $id  
* @property string $number  
* @property string|null $type  
* @property string|null $dni  
* @property string|null $owner  
* @property string|null $customer  
* @property string|null $note  
* @property integer|null $bank__bank__id  
   
 *
 * Relations:
 * @property \bank\models\Bank $bank
 * @property \bank\models\Transaction[] $transactions
 * @property \bank\models\Transfer $transfer
 */
class Account extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__account';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['number'], 'required'],
			[['id','bank__bank__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['number'], 'string', 'max' => 24],
			[['dni'], 'string', 'max' => 12],
			[['owner'], 'string', 'max' => 128],
			[['type'], 'range', 'range' => ['CHECKING', 'SAVING', 'ELECTRONIC', 'OTHER'],'strict' => true],
			[['customer'], 'range', 'range' => ['OWN', 'NATURAL', 'BUSINESS'],'strict' => true],
			[['number'], 'unique'],
			[['bank__bank__id'], 'exist', 'targetClass' => \bank\models\Bank::className(),'targetAttribute' => ['bank__bank__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bank\models\Bank]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBank()
    {
        return $this->hasOne(\bank\models\Bank::className(), ['id' => 'bank__bank__id']);
    }

    /**
     * Gets query for [[bank\models\Transaction]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransactions()
    {
        return $this->hasMany(\bank\models\Transaction::className(), ['bank__account__id' => 'id']);
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