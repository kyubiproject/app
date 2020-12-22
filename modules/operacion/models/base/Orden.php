<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden".
 *
 * Columns:
* @property integer $delegacion_id  
* @property string|null $cliente  
* @property string $tipo_contrato  
* @property string $tipo_id  
* @property string $tipo_tarifa  
* @property string|null $momento  
* @property string $estado  
* @property string $codigo  
* @property integer|null $orden_id  
   
 *
 * Relations:
 * @property \comun\models\base\Delegacion $delegacion
 * @property Orden $orden
 * @property OrdenDetalles $detalles
 * @property OrdenEntrega $entrega
 * @property OrdenObservacion $observacion
 * @property OrdenRecogida $recogida
 * @property \flota\models\base\Tipo $tipo
 * @property OrdenHistoria $historias
 * @property OrdenTarifa $tarifas
 * @property \flota\models\base\Vehiculo $vehiculos
 * @property Orden $ordens
 * @property \flota\models\base\VehiculoHistoria $vehiculoHistorias
 */
class Orden extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['delegacion_id', 'tipo_contrato', 'tipo_id', 'codigo'], 'required'],
			[['delegacion_id', 'orden_id'], 'integer'],
			[['cliente'], 'string', 'max' => 100],
			[['tipo_id'], 'string', 'max' => 3],
			[['codigo'], 'string', 'max' => 16],
			[['tipo_contrato'], 'in', 'range' => ['CP', 'LP'], 'strict' => true],
			[['tipo_tarifa'], 'in', 'range' => ['DAY', 'MONTH', 'HOUR'], 'strict' => true],
			[['momento'], 'in', 'range' => ['PRESUPUESTO', 'RESERVA', 'CONTRATO', 'EXTENSION'], 'strict' => true],
			[['estado'], 'in', 'range' => ['EN VIGOR', 'ANULADO', 'FINALIZADO'], 'strict' => true],
			[['codigo'], 'unique'],
			[['delegacion_id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']],
			[['tipo_id'], 'exist', 'targetClass' => \flota\models\base\Tipo::className(), 'targetAttribute' => ['tipo_id' => 'id']],
			[['orden_id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['orden_id' => 'id']]        
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
     * Gets query for [[Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrden()
    {
        return $this->hasOne(Orden::className(), ['id' => 'orden_id']);
    }

    /**
     * Gets query for [[OrdenDetalles]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDetalles()
    {
        return $this->hasOne(OrdenDetalles::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[OrdenEntrega]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEntrega()
    {
        return $this->hasOne(OrdenEntrega::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[OrdenObservacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getObservacion()
    {
        return $this->hasOne(OrdenObservacion::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[OrdenRecogida]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRecogida()
    {
        return $this->hasOne(OrdenRecogida::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[\flota\models\base\Tipo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipo()
    {
        return $this->hasOne(\flota\models\base\Tipo::className(), ['id' => 'tipo_id']);
    }

    /**
     * Gets query for [[OrdenHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getHistorias()
    {
        return $this->hasMany(OrdenHistoria::className(), ['orden_id' => 'id']);
    }

    /**
     * Gets query for [[OrdenTarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifas()
    {
        return $this->hasMany(OrdenTarifa::className(), ['orden_id' => 'id']);
    }

    /**
     * Gets query for [[\flota\models\base\Vehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculos()
    {
        return $this->hasMany(\flota\models\base\Vehiculo::className(), ['id' => 'vehiculo_id'])->viaTable('operacion__orden_vehiculo', ['id' => 'id']);
    }

    /**
     * Gets query for [[Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdens()
    {
        return $this->hasMany(Orden::className(), ['orden_id' => 'id']);
    }

    /**
     * Gets query for [[\flota\models\base\VehiculoHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculoHistorias()
    {
        return $this->hasMany(\flota\models\base\VehiculoHistoria::className(), ['orden_codigo' => 'codigo']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'delegacion' => ['type'=>'hasOne','refClass'=>'comun\\models\\base\\Delegacion','refColumn'=>'id','column'=>'delegacion_id'],
			'orden' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\Orden','refColumn'=>'id','column'=>'orden_id'],
			'detalles' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\OrdenDetalles','refColumn'=>'id','column'=>'id'],
			'entrega' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\OrdenEntrega','refColumn'=>'id','column'=>'id'],
			'observacion' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\OrdenObservacion','refColumn'=>'id','column'=>'id'],
			'recogida' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\OrdenRecogida','refColumn'=>'id','column'=>'id'],
			'tipo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Tipo','refColumn'=>'id','column'=>'tipo_id'],
			'historias' => ['type'=>'hasMany','refClass'=>'operacion\\models\\base\\OrdenHistoria','refColumn'=>'orden_id','column'=>'id'],
			'tarifas' => ['type'=>'hasMany','refClass'=>'operacion\\models\\base\\OrdenTarifa','refColumn'=>'orden_id','column'=>'id'],
			'vehiculos' => ['type'=>'hasMany','refClass'=>'flota\\models\\base\\Vehiculo','refColumn'=>'id','column'=>'vehiculo_id'],
			'ordens' => ['type'=>'hasMany','refClass'=>'operacion\\models\\base\\Orden','refColumn'=>'orden_id','column'=>'id'],
			'vehiculoHistorias' => ['type'=>'hasMany','refClass'=>'flota\\models\\base\\VehiculoHistoria','refColumn'=>'orden_codigo','column'=>'codigo']
		];
	}
}