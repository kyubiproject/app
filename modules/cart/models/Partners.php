<?php
namespace cart\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "cart_partners".
 *
 * Columns:
* @property integer $id  
* @property integer $contacts_id  
* @property string $bank_account  
* @property integer $gateways_id  
* @property integer $currencies_id  
* @property integer $participation  
* @property string $start  
   
 *
 * Relations:
 * @property \common\models\Contacts $contacts
 * @property Currencies $currencies
 * @property Gateways $gateways
 */
class Partners extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'cart_partners';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['contacts_id', 'bank_account', 'gateways_id', 'currencies_id', 'participation', 'start'], 'required'],
			[['id', 'contacts_id', 'gateways_id', 'currencies_id', 'participation'], 'is', 'type' => 'int'],
			[['bank_account'], 'string', 'max' => 100],
			[['start'], 'type', 'type' => 'datetime', 'datetimeFormat' => 'yyyy-mm-dd hh:mm'],
			[['contacts_id'], 'exist', 'targetClass' => \common\models\Contacts::className(), 'targetAttribute' => ['contacts_id' => 'id']],
			[['currencies_id'], 'exist', 'targetClass' => Currencies::className(), 'targetAttribute' => ['currencies_id' => 'id']],
			[['gateways_id'], 'exist', 'targetClass' => Gateways::className(), 'targetAttribute' => ['gateways_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\common\models\Contacts]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getContacts()
    {
        return $this->hasOne(\common\models\Contacts::className(), ['id' => 'contacts_id']);
    }

    /**
     * Gets query for [[Currencies]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCurrencies()
    {
        return $this->hasOne(Currencies::className(), ['id' => 'currencies_id']);
    }

    /**
     * Gets query for [[Currencies]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGateways()
    {
        return $this->hasOne(Currencies::className(), ['id' => 'currencies_id']);
    }
}