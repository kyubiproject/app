<?php
namespace app\models\base;

/**
 * This is the model class for table "tours".
 *
 * Columns:
* @property integer $id  
* @property boolean|null $enabled  
* @property string $name  
* @property string|null $subtitle  
* @property string|null $introduction  
* @property string $description  
* @property double $price_adults  
* @property double|null $price_children  
* @property string|null $price_provider  
* @property integer|null $children_min_age  
* @property integer|null $children_max_age  
* @property integer|null $adults_min_age  
* @property integer|null $adults_max_age  
* @property string|null $pickup_details  
* @property string|null $terms_and_conditions  
* @property integer $providers_id  
* @property integer $regions_id  
* @property integer $currencies_id  
 */
class Tours extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'tours';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name', 'description', 'price_adults', 'providers_id', 'regions_id', 'currencies_id'], 'required'],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['name', 'subtitle'], 'string', 'max' => 100],
			[['introduction'], 'string', 'max' => 300],
			[['price_provider'], 'string', 'max' => 11],
			[['currencies_id'], 'exist', 'targetClass' => \app\models\base\cart\Currencies::className(), 'targetAttribute' => ['currencies_id' => 'id']],
			[['providers_id'], 'exist', 'targetClass' => \app\models\base\common\Providers::className(), 'targetAttribute' => ['providers_id' => 'id']],
			[['regions_id'], 'exist', 'targetClass' => \app\models\base\common\Regions::className(), 'targetAttribute' => ['regions_id' => 'id']]        
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