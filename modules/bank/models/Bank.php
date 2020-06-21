<?php
namespace bank\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bank__bank".
 *
 * Columns:
* @property integer $id  
* @property string|null $name  
* @property string $legal  
* @property string|null $swift  
* @property integer|null $aba  
* @property string|null $country  
   
 *
 * Relations:
 * @property \bank\models\Account[] $accounts
 * @property \bank\models\FeeBank[] $feeBanks
 * @property \bank\models\Fee[] $fees
 */
class Bank extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bank__bank';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['legal'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['aba'], 'is', 'type' => "mediumint",'unsigned' => true],
			[['name'], 'string', 'max' => 16],
			[['legal'], 'string', 'max' => 128],
			[['swift'], 'string', 'max' => 12],
			[['country'], 'string', 'max' => 64]        
        ];
    }

    /**
     * Gets query for [[bank\models\Account]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAccounts()
    {
        return $this->hasMany(\bank\models\Account::className(), ['bank__bank__id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\FeeBank]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFeeBanks()
    {
        return $this->hasMany(\bank\models\FeeBank::className(), ['bank__bank__id' => 'id']);
    }

    /**
     * Gets query for [[bank\models\Fee]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFees()
    {
        return $this->hasMany(\bank\models\Fee::className(), ['id' => 'bank__fee__id'])->via('feeBanks');
    }
}