<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__modelo_caracteristicas".
 *
 * Columns:
* @property integer $id  
* @property string|null $potencia  
* @property string|null $combustible  
* @property integer|null $combustible_cap  
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
    protected static $_config = 'flota/config/models/modelo-caracteristicas';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/modelo-caracteristicas';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id'], 'required'],
			[['id', 'combustible_cap'], 'integer'],
			[['potencia'], 'string', 'max' => 10],
			[['combustible'], 'in', 'range' => ['GASOLINA', 'DIESEL', 'ELECTRICO', 'HIBRIDO'], 'strict' => true],
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

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'modelo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Modelo','refColumn'=>'id','column'=>'id']
		];
	}
}