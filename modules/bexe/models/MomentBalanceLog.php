<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__moment_balance_log".
 *
 * Columns:
* @property integer $id  
* @property integer $bexe__moment__id  
* @property double $current  
* @property double $last  
* @property string $updated_at  
   
 *
 * Relations:
 * @property \bexe\models\Moment $moment
 */
class MomentBalanceLog extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__moment_balance_log';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['bexe__moment__id','current','last'], 'required'],
			[['id'], 'is', 'type' => "int",'unsigned' => true],
			[['bexe__moment__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['current','last'], 'is', 'type' => "double",'size' => "20, 2"],
			[['updated_at'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['updated_at'], 'default', 'value' => ['expression' => CURRENT_TIMESTAMP,'params' => []]],
			[['bexe__moment__id'], 'exist', 'targetClass' => \bexe\models\Moment::className(),'targetAttribute' => ['bexe__moment__id' => id]]        
        ];
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
}