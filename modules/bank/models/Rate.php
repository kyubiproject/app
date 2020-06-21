<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__rate".
 *
 * Columns:
* @property integer $id  
* @property double|null $rate  
* @property boolean $is_flat  
* @property string|null $sign  
* @property double|null $amount  
* @property string|null $status  
* @property string|null $valid_since  
* @property string|null $valid_until  
* @property integer $bank__fee__id  
   
 *
 * Relations:
 * @property \bank\models\Fee $fee
 */
class Rate extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__rate';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','bank__fee__id'], 'required'],
			[['id','bank__fee__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['rate'], 'is', 'type' => "double",'size' => "15, 3"],
			[['amount'], 'is', 'type' => "double",'size' => "15, 2"],
			[['is_flat'], 'boolean'],
			[['is_flat'], 'default', 'value' => 0],
			[['sign'], 'string', 'max' => 2],
			[['status'], 'range', 'range' => ['OK', 'REJECT', 'CANCEL'],'strict' => true],
			[['valid_since','valid_until'], 'type', 'type' => "date",'dateFormat' => "yyyy-mm-dd"],
			[['bank__fee__id'], 'exist', 'targetClass' => \bank\models\Fee::className(),'targetAttribute' => ['bank__fee__id' => id]]        
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
}