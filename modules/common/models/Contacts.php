<?php
namespace common\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "common_contacts".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $job  
* @property string|null $address  
* @property string|null $phone  
* @property string|null $cellphone  
* @property string|null $email  
* @property integer $provider_id  
* @property boolean|null $enabled  
* @property string|null $photo  
   
 *
 * Relations:
 * @property \cart\models\Partners[] $partners
 * @property \common\models\Providers $providers
 */
class Contacts extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_contacts';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name','provider_id'], 'required'],
			[['id','provider_id'], 'is', 'type' => "int"],
			[['name','job','address'], 'string', 'max' => 200],
			[['phone','cellphone','email'], 'string', 'max' => 100],
			[['photo'], 'string', 'max' => 255],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['provider_id'], 'exist', 'targetClass' => \common\models\Providers::className(),'targetAttribute' => ['provider_id' => id]]        
        ];
    }

    /**
     * Gets query for [[cart\models\Partners]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPartners()
    {
        return $this->hasMany(\cart\models\Partners::className(), ['contacts_id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Providers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProviders()
    {
        return $this->hasOne(\common\models\Providers::className(), ['id' => 'provider_id']);
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