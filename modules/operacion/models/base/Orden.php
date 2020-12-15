<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden".
 *
 * Columns:
* @property integer|null $delegacion_id  
* @property string|null $cliente  
* @property string $tipo_contrato  
* @property string $tipo_id  
* @property string $tipo_tarifa  
   
 *
 * Relations:
 * @property \comun\models\base\Delegacion $delegacion
 * @property OrdenDetalles $detalles
 * @property OrdenObservacion $observacion
 * @property OrdenSituacion $situacion
 * @property OrdenTarifa $tarifa
 * @property OrdenVehiculo $vehiculo
 * @property \flota\models\base\Tipo $tipo
 * @property OrdenHistoria $historias
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
			[['tipo_contrato', 'tipo_id', 'tipo_tarifa'], 'required'],
			[['delegacion_id'], 'integer'],
			[['cliente'], 'string', 'max' => 100],
			[['tipo_id'], 'string', 'max' => 3],
			[['tipo_contrato'], 'in', 'range' => ['CP', 'LP'], 'strict' => true],
			[['tipo_tarifa'], 'in', 'range' => ['HORA', 'DIA', 'MES'], 'strict' => true],
			[['delegacion_id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']],
			[['tipo_id'], 'exist', 'targetClass' => \flota\models\base\Tipo::className(), 'targetAttribute' => ['tipo_id' => 'id']]        
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
     * Gets query for [[OrdenDetalles]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDetalles()
    {
        return $this->hasOne(OrdenDetalles::className(), ['id' => 'id']);
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
     * Gets query for [[OrdenSituacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSituacion()
    {
        return $this->hasOne(OrdenSituacion::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[OrdenTarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifa()
    {
        return $this->hasOne(OrdenTarifa::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[OrdenVehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculo()
    {
        return $this->hasOne(OrdenVehiculo::className(), ['id' => 'id']);
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
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'delegacion' => ['type'=>'hasOne','refClass'=>'comun\\models\\base\\Delegacion','refColumn'=>'id','column'=>'delegacion_id'],
			'detalles' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\OrdenDetalles','refColumn'=>'id','column'=>'id'],
			'observacion' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\OrdenObservacion','refColumn'=>'id','column'=>'id'],
			'situacion' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\OrdenSituacion','refColumn'=>'id','column'=>'id'],
			'tarifa' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\OrdenTarifa','refColumn'=>'id','column'=>'id'],
			'vehiculo' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\OrdenVehiculo','refColumn'=>'id','column'=>'id'],
			'tipo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Tipo','refColumn'=>'id','column'=>'tipo_id'],
			'historias' => ['type'=>'hasMany','refClass'=>'operacion\\models\\base\\OrdenHistoria','refColumn'=>'orden_id','column'=>'id']
		];
	}
}