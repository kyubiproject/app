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
* @property string $fecha  
* @property string|null $contrato_numero  
* @property string|null $descripcion  
   
 *
 * Relations:
 * @property \comun\models\base\Delegacion $delegacion
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
			[['vehiculo_id', 'estado', 'fecha'], 'required'],
			[['vehiculo_id', 'delegacion_id', 'km', 'combustible'], 'integer'],
			[['estado'], 'in', 'range' => ['DISPONIBLE', 'RESERVADO', 'CONTRATADO', 'AVERIADO', 'MANTENIMIENTO', 'BAJA', 'ENTREGADO', 'RECIBIDO', 'RENOVADO', 'SISTEMA'], 'strict' => true],
			[['fecha'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['contrato_numero'], 'string', 'max' => 16],
			[['vehiculo_id'], 'exist', 'targetClass' => Vehiculo::className(), 'targetAttribute' => ['vehiculo_id' => 'id']],
			[['delegacion_id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']]        
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
			'delegacion' => ['type'=>'hasOne','refClass'=>'\\comun\\models\\base\\Delegacion','refColumn'=>'id','column'=>'delegacion_id'],
			'vehiculo' => ['type'=>'hasOne','refClass'=>'Vehiculo','refColumn'=>'id','column'=>'vehiculo_id']
		];
	}
}