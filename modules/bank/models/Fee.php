<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__fee".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $code  
* @property string|null $note  
* @property boolean|null $is_active  
   
 *
 * Relations:
 * @property \bank\models\Bank[] $banks
 * @property \bank\models\FeeBank[] $feeBanks
 * @property \bank\models\FeeTransacctionType[] $feeTransacctionTypes
 * @property \bank\models\Rate[] $rates
 * @property \bank\models\TransactionType[] $transactionTypes
 */
class Fee extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__fee';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['name'], 'string', 'max' => 64],
			[['code'], 'string', 'max' => 16],
			[['is_active'], 'boolean'],
			[['is_active'], 'default', 'value' => 1]        
        ];
    }

    /**
     * Gets query for [[bank\models\Bank]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBanks()
    {
        return $this->hasMany(\bank\models\Bank::className(), ['id' => 'bank__bank__id'])->via('feeBanks');
    }

    /**
     * Gets query for [[bank\models\FeeBank]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFeeBanks()
    {
        return $this->hasMany(\bank\models\FeeBank::className(), ['bank__fee__id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\FeeTransacctionType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFeeTransacctionTypes()
    {
        return $this->hasMany(\bank\models\FeeTransacctionType::className(), ['bank__fee__id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\Rate]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRates()
    {
        return $this->hasMany(\bank\models\Rate::className(), ['bank__fee__id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\TransactionType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTransactionTypes()
    {
        return $this->hasMany(\bank\models\TransactionType::className(), ['id' => 'bank__transacction_type__id'])->via('feeTransacctionTypes');
    }
}