<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__fee_bank".
 *
 * Columns:
* @property integer $bank__fee__id  
* @property integer $bank__bank__id  
   
 *
 * Relations:
 * @property \bank\models\Bank $bank
 * @property \bank\models\Fee $fee
 */
class FeeBank extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__fee_bank';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['bank__fee__id','bank__bank__id'], 'required'],
			[['bank__fee__id','bank__bank__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[{'{\'targetAttribute\':[\'bank__bank__id\',\'bank__fee__id\']}':'bank__bank__id'}, 'unique'],
			[['bank__fee__id'], 'exist', 'targetClass' => \bank\models\Fee::className(),'targetAttribute' => ['bank__fee__id' => id]],
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
     * Gets query for [[bank\models\Fee]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFee()
    {
        return $this->hasOne(\bank\models\Fee::className(), ['id' => 'bank__fee__id']);
    }
}