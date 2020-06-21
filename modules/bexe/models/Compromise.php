<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__compromise".
 *
 * Columns:
* @property integer $id  
* @property string|null $dni  
* @property string|null $provider  
* @property integer $bexe__compromise_type__id  
   
 *
 * Relations:
 * @property \bexe\models\CompromiseType $compromiseType
 * @property \bexe\models\Moment $moment
 */
class Compromise extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__compromise';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','bexe__compromise_type__id'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['bexe__compromise_type__id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['dni'], 'string', 'max' => 12],
			[['provider'], 'string', 'max' => 128],
			[['id'], 'exist', 'targetClass' => \bexe\models\Moment::className(),'targetAttribute' => ['id' => id]],
			[['bexe__compromise_type__id'], 'exist', 'targetClass' => \bexe\models\CompromiseType::className(),'targetAttribute' => ['bexe__compromise_type__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bexe\models\CompromiseType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCompromiseType()
    {
        return $this->hasOne(\bexe\models\CompromiseType::className(), ['id' => 'bexe__compromise_type__id']);
    }

    /**
     * Gets query for [[bexe\models\Moment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoment()
    {
        return $this->hasOne(\bexe\models\Moment::className(), ['id' => 'id']);
    }
}