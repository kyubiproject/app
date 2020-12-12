<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__modelo_caracteristicas".
 *
 * Columns:
* @property integer $id  
* @property string|null $potencia  
* @property string|null $combustible  
* @property boolean|null $combustible_cap  
* @property float|null $largo  
* @property float|null $ancho  
* @property float|null $alto  
   
 *
 * Relations:
 * @property Modelo $modelo
 */
class ModeloCaracteristicas extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__modelo_caracteristicas';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'modelo-caracteristicas';

    /**
     *
     * @var string
     */
    protected static $_lang = 'modelo-caracteristicas';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id'], 'required'],
			[['id'], 'number'],
			[['potencia'], 'string', 'max' => 10],
			[['combustible'], 'in', 'range' => ['GASOLINA', 'DIESEL', 'ELECTRICO', 'HIBRIDO'], 'strict' => true],
			[['combustible_cap'], 'is', 'type' => 'tinyint'],
			[['largo', 'ancho', 'alto'], 'is', 'type' => 'float', 'size' => '5, 2'],
			[['id'], 'exist', 'targetClass' => Modelo::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelo()
    {
        return $this->hasOne(Modelo::className(), ['id' => 'id']);
    }
}