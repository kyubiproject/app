<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo_historia".
 *
 * Columns:
* @property integer $vehiculo_id  
* @property integer|null $delegacion_id  
* @property string $estado  
* @property integer|null $km  
* @property integer|null $combustible  
* @property string|null $orden_codigo  
   
 *
 * Relations:
 * @property \comun\models\base\Delegacion $delegacion
 * @property \operacion\models\base\Orden $orden
 * @property Vehiculo $vehiculo
 */
class VehiculoHistoria extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__vehiculo_historia';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/vehiculo-historia';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/vehiculo-historia';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['vehiculo_id', 'estado'], 'required'],
			[['vehiculo_id', 'delegacion_id', 'km', 'combustible'], 'integer'],
			[['estado'], 'in', 'range' => ['DISPONIBLE', 'RESERVA', 'CONTRATO', 'ENTREGADO', 'AVERIADO', 'MANTENIMIENTO', 'BAJA'], 'strict' => true],
			[['orden_codigo'], 'string', 'max' => 16],
			[['delegacion_id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']],
			[['vehiculo_id'], 'exist', 'targetClass' => Vehiculo::className(), 'targetAttribute' => ['vehiculo_id' => 'id']],
			[['orden_codigo'], 'exist', 'targetClass' => \operacion\models\base\Orden::className(), 'targetAttribute' => ['orden_codigo' => 'codigo']]        
        ];
    }

    /**
     * Gets query for [[\comun\models\base\Delegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDelegacion()
    {
        return $this->hasOne(\comun\models\base\Delegacion::className(), ['id' => 'delegacion_id']);
    }

    /**
     * Gets query for [[\operacion\models\base\Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrden()
    {
        return $this->hasOne(\operacion\models\base\Orden::className(), ['codigo' => 'orden_codigo']);
    }

    /**
     * Gets query for [[Vehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculo()
    {
        return $this->hasOne(Vehiculo::className(), ['id' => 'vehiculo_id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'delegacion' => ['type'=>'hasOne','refClass'=>'comun\\models\\base\\Delegacion','refColumn'=>'id','column'=>'delegacion_id'],
			'orden' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\Orden','refColumn'=>'codigo','column'=>'orden_codigo'],
			'vehiculo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Vehiculo','refColumn'=>'id','column'=>'vehiculo_id']
		];
	}
}