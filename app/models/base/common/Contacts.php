<?php
namespace app\models\base\common;

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
 */
class Contacts extends \kyubi\base\ActiveRecord
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
			[['name', 'provider_id'], 'required'],
			[['name', 'job', 'address'], 'string', 'max' => 200],
			[['phone', 'cellphone', 'email'], 'string', 'max' => 100],
			[['photo'], 'string', 'max' => 255],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['provider_id'], 'exist', 'targetClass' => Providers::className(), 'targetAttribute' => ['provider_id' => 'id']]        
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