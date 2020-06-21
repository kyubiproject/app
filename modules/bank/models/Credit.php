<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__credit".
 *
 * Columns:
* @property integer $id  
* @property string|null $name  
* @property float $rate  
* @property float|null $commission  
* @property integer $period  
* @property string|null $note  
   
 *
 * Relations:
 * @property \bank\models\Transaction $transaction
 */
class Credit extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__credit';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['rate','period'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['rate','commission'], 'is', 'type' => "float",'size' => "7, 2"],
			[['period'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['name'], 'string', 'max' => 128],
			[['rate'], 'unique'],
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