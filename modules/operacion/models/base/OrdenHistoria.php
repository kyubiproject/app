<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_historia".
 *
 * Columns:
* @property integer $orden_id  
* @property string $estado_orden  
* @property string $codigo  
* @property integer $delegacion_id  
* @property string|null $tipo_contrato  
* @property string|null $fecha_entrega  
* @property string|null $fecha_recogida  
* @property string|null $vehiculo_matricula  
* @property string|null $tipo_id  
* @property integer|null $tarifa_id  
* @property string|null $cliente  
* @property string $estado  
   
 *
 * Relations:
 * @property \comun\models\base\Delegacion $delegacion
 * @property Orden $orden
 * @property \flota\models\base\Tarifa $tarifa
 * @property \flota\models\base\Tipo $tipo
 * @property \flota\models\base\Vehiculo $vehiculo
 */
class OrdenHistoria extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_historia';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-historia';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-historia';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['orden_id', 'estado_orden', 'codigo', 'delegacion_id'], 'required'],
			[['orden_id', 'delegacion_id', 'tarifa_id'], 'integer'],
			[['estado_orden'], 'in', 'range' => ['PRESUPUESTO', 'RESERVA', 'CONTRATO'], 'strict' => true],
			[['tipo_contrato'], 'in', 'range' => ['CP', 'LP'], 'strict' => true],
			[['estado'], 'in', 'range' => ['EN VIGOR', 'ANULADO', 'FINALIZADO'], 'strict' => true],
			[['codigo'], 'string', 'max' => 16],
			[['vehiculo_matricula'], 'string', 'max' => 10],
			[['tipo_id'], 'string', 'max' => 3],
			[['cliente'], 'string', 'max' => 100],
			[['fecha_entrega', 'fecha_recogida'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['codigo'], 'unique'],
			[['orden_id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['orden_id' => 'id']],
			[['delegacion_id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']],
			[['vehiculo_matricula'], 'exist', 'targetClass' => \flota\models\base\Vehiculo::className(), 'targetAttribute' => ['vehiculo_matricula' => 'matricula']],
			[['tipo_id'], 'exist', 'targetClass' => \flota\models\base\Tipo::className(), 'targetAttribute' => ['tipo_id' => 'id']],
			[['tarifa_id'], 'exist', 'targetClass' => \flota\models\base\Tarifa::className(), 'targetAttribute' => ['tarifa_id' => 'id']]        
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
     * Gets query for [[\flota\models\base\Tarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifa()
    {
        return $this->hasOne(\flota\models\base\Tarifa::className(), ['id' => 'tarifa_id']);
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
     * Gets query for [[\flota\models\base\Vehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculo()
    {
        return $this->hasOne(\flota\models\base\Vehiculo::className(), ['matricula' => 'vehiculo_matricula']);
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
			'tarifa' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Tarifa','refColumn'=>'id','column'=>'tarifa_id'],
			'tipo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Tipo','refColumn'=>'id','column'=>'tipo_id'],
			'vehiculo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Vehiculo','refColumn'=>'matricula','column'=>'vehiculo_matricula']
		];
	}
}