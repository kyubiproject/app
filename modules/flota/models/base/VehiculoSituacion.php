<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo_situacion".
 *
 * Columns:
* @property integer $id  
* @property integer|null $delegacion_id  
* @property string $estado  
* @property string $descripcion  
* @property string|null $emplazamiento  
* @property integer $km  
* @property integer $combustible  
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
			[['id', 'estado', 'descripcion', 'km', 'combustible'], 'required'],
			[['id', 'delegacion_id', 'km', 'combustible'], 'number'],
			[['id', 'delegacion_id', 'km', 'combustible'], 'integer'],
			[['estado'], 'in', 'range' => ['DISPONIBLE', 'RESERVADO', 'CONTRATADO', 'AVERIADO', 'MANTENIMIENTO', 'BAJA', 'ENTREGADO', 'RECIBIDO', 'RENOVADO'], 'strict' => true],
			[['codigo_llave', 'codigo_radio'], 'string', 'max' => 10],
			[['id'], 'exist', 'targetClass' => Vehiculo::className(), 'targetAttribute' => ['id' => 'id']],
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
        return $this->hasOne(Vehiculo::className(), ['id' => 'id']);
    }
}