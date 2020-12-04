<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__modelo".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property integer|null $familia__id  
* @property integer|null $potencia  
* @property string|null $combustible  
* @property integer|null $combustible_cap  
* @property integer|null $marca__id  
 */
class Modelo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'flota__modelo';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre'], 'required'],
			[['nombre'], 'string', 'max' => 100],
			[['marca__id'], 'exist', 'targetClass' => Marca::className(), 'targetAttribute' => ['marca__id' => 'id']],
			[['familia__id'], 'exist', 'targetClass' => Familia::className(), 'targetAttribute' => ['familia__id' => 'id']]        
        ];
    }
}