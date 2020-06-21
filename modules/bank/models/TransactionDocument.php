<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__transaction_document".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property integer|null $size  
* @property string|null $type  
* @property string|null $content  
   
 *
 * Relations:
 * @property \bank\models\Transaction $transaction
 */
class TransactionDocument extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__transaction_document';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','name'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['name','type'], 'string', 'max' => 255],
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