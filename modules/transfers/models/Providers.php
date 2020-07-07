<?php
namespace transfers\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "transfers_providers".
 *
 * Columns:
* @property integer $id  
* @property integer $provider_id  
* @property integer $maximum_passangers  
   
 *
 * Relations:
 * @property \common\models\Providers $providers
 */
class Providers extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'transfers_providers';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['provider_id', 'maximum_passangers'], 'required'],
			[['id', 'provider_id', 'maximum_passangers'], 'is', 'type' => 'int'],
			[['provider_id'], 'exist', 'targetClass' => \common\models\Providers::className(), 'targetAttribute' => ['provider_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\common\models\Providers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProviders()
    {
        return $this->hasOne(\common\models\Providers::className(), ['id' => 'provider_id']);
    }
}