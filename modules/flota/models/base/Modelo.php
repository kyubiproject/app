<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__modelo".
 *
 * Columns:
* @property string $nombre  
* @property string|null $descripcion  
* @property integer|null $marca_id  
* @property string|null $tipo_id  
   
 *
 * Relations:
 * @property Marca $marca
 * @property ModeloCaracteristicas $caracteristicas
 * @property ModeloCarga $carga
 * @property Tipo $tipo
 * @property Vehiculo $vehiculos
 */
class Modelo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__modelo';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/modelo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/modelo';

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
			[['tipo_id'], 'string', 'max' => 3],
			[['marca_id'], 'integer'],
			[['marca_id'], 'exist', 'targetClass' => Marca::className(), 'targetAttribute' => ['marca_id' => 'id']],
			[['tipo_id'], 'exist', 'targetClass' => Tipo::className(), 'targetAttribute' => ['tipo_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Marca]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMarca()
    {
        return $this->hasOne(Marca::className(), ['id' => 'marca_id']);
    }

    /**
     * Gets query for [[ModeloCaracteristicas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCaracteristicas()
    {
        return $this->hasOne(ModeloCaracteristicas::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[ModeloCarga]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCarga()
    {
        return $this->hasOne(ModeloCarga::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[Tipo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipo()
    {
        return $this->hasOne(Tipo::className(), ['id' => 'tipo_id']);
    }

    /**
     * Gets query for [[Vehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculos()
    {
        return $this->hasMany(Vehiculo::className(), ['modelo_id' => 'id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'marca' => ['type'=>'hasOne','refClass'=>'Marca','refColumn'=>'id','column'=>'marca_id'],
			'caracteristicas' => ['type'=>'hasOne','refClass'=>'ModeloCaracteristicas','refColumn'=>'id','column'=>'id'],
			'carga' => ['type'=>'hasOne','refClass'=>'ModeloCarga','refColumn'=>'id','column'=>'id'],
			'tipo' => ['type'=>'hasOne','refClass'=>'Tipo','refColumn'=>'id','column'=>'tipo_id'],
			'vehiculos' => ['type'=>'hasMany','refClass'=>'Vehiculo','refColumn'=>'modelo_id','column'=>'id']
		];
	}
}