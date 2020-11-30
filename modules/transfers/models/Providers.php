<?php
namespace transfers\models;

/**
 * This is the model class for table "transfers_providers".
 *
 * Columns:
* @property integer $id  
* @property integer $provider_id  
* @property integer $maximum_passangers  
 */
class Providers extends \kyubi\base\ActiveRecord
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
}