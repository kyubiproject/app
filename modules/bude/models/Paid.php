<?php
namespace bude\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "bude_paid".
 *
 * Columns:
* @property integer $id  
* @property string $created_at  
   
 *
 * Relations:
 * @property \bude\models\Caused[] $causeds
 * @property \bude\models\Moment $moment
 * @property \bude\models\PaidCaused[] $paidCauseds
 */
class Paid extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bude_paid';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['created_at'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['created_at'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['id'], 'exist', 'targetClass' => \bude\models\Moment::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[bude\models\Caused]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCauseds()
    {
        return $this->hasMany(\bude\models\Caused::className(), ['id' => 'bude_caused__id'])->via('paidCauseds');
    }

    /**
     * Gets query for [[bude\models\Moment]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMoment()
    {
        return $this->hasOne(\bude\models\Moment::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bude\models\PaidCaused]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPaidCauseds()
    {
        return $this->hasMany(\bude\models\PaidCaused::className(), ['bude_paid__id' => 'id']);
    }
}