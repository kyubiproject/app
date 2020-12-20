<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo_situacion".
 *
 * Columns:
* @property integer $id  
* @property integer $delegacion_id  
* @property string $estado  
* @property string|null $descripcion  
* @property string|null $emplazamiento  
* @property integer|null $km  
* @property integer|null $combustible  
* @property string|null $codigo_llave  
* @property string|null $codigo_radio  
   
 *
 * Relations:
 * @property \comun\models\base\Delegacion $delegacion
 * @property Vehiculo $vehiculo
 */
class VehiculoSituacion extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__vehiculo_situacion';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/vehiculo-situacion';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/vehiculo-situacion';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'delegacion_id'], 'required'],
			[['id', 'delegacion_id', 'km', 'combustible'], 'integer'],
			[['estado'], 'in', 'range' => ['DISPONIBLE', 'RESERVA', 'CONTRATO', 'ENTREGADO', 'AVERIADO', 'MANTENIMIENTO', 'BAJA'], 'strict' => true],
			[['codigo_llave', 'codigo_radio'], 'string', 'max' => 10],
			[['delegacion_id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']],
			[['id'], 'exist', 'targetClass' => Vehiculo::className(), 'targetAttribute' => ['id' => 'id']]        
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
        return $this->hasOne(Vehiculo::className(), ['id' => 'id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'delegacion' => ['type'=>'hasOne','refClass'=>'comun\\models\\base\\Delegacion','refColumn'=>'id','column'=>'delegacion_id'],
			'vehiculo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Vehiculo','refColumn'=>'id','column'=>'id']
		];
	}
}