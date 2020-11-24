<?php
namespace app\models\base\cart;

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
 */
class Partners extends \kyubi\base\ActiveRecord
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
			[['bank_account'], 'string', 'max' => 100],
			[['start'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss'],
			[['contacts_id'], 'exist', 'targetClass' => \app\models\base\common\Contacts::className(), 'targetAttribute' => ['contacts_id' => 'id']],
			[['currencies_id'], 'exist', 'targetClass' => Currencies::className(), 'targetAttribute' => ['currencies_id' => 'id']],
			[['gateways_id'], 'exist', 'targetClass' => Gateways::className(), 'targetAttribute' => ['gateways_id' => 'id']]        
        ];
    }
    
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:getDb()
     */
    public static function getDb()
    {
        return app('viajes');
    }
}