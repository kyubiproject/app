<?php
namespace tours\models;

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
			[['id', 'children_min_age', 'children_max_age', 'adults_min_age', 'adults_max_age', 'providers_id', 'regions_id', 'currencies_id'], 'is', 'type' => 'int'],
			[['price_adults', 'price_children'], 'is', 'type' => 'double', 'size' => '10, 2'],
			[['enabled'], 'boolean'],
			[['enabled'], 'default', 'value' => 1],
			[['name', 'subtitle'], 'string', 'max' => 100],
			[['introduction'], 'string', 'max' => 300],
			[['price_provider'], 'string', 'max' => 11],
			[['currencies_id'], 'exist', 'targetClass' => \cart\models\Currencies::className(), 'targetAttribute' => ['currencies_id' => 'id']],
			[['providers_id'], 'exist', 'targetClass' => \common\models\Providers::className(), 'targetAttribute' => ['providers_id' => 'id']],
			[['regions_id'], 'exist', 'targetClass' => \common\models\Regions::className(), 'targetAttribute' => ['regions_id' => 'id']]        
        ];
    }
}