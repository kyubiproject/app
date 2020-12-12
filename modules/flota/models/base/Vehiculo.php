<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo".
 *
 * Columns:
* @property integer $id  
* @property string $matricula  
* @property string|null $fecha_matricula  
* @property string|null $bastidor  
* @property string|null $estado  
* @property string $fecha_estado  
* @property integer|null $modelo_id  
   
 *
 * Relations:
 * @property Modelo $modelo
 * @property VehiculoCaracteristicas $caracteristicas
 * @property VehiculoDelegacion $delegacions
 * @property \operacion\models\base\OrdenVehiculo $ordenVehiculos
 * @property \operacion\models\base\Orden $ordens
 * @property VehiculoMovimiento $movimientos
 */
class Vehiculo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__vehiculo';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/vehiculo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/vehiculo';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['matricula'], 'required'],
			[['id', 'modelo_id'], 'number'],
			[['matricula'], 'string', 'max' => 10],
			[['bastidor'], 'string', 'max' => 30],
			[['fecha_matricula'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['fecha_estado'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss'],
			[['estado'], 'in', 'range' => ['DISPONIBLE', 'RESERVADO', 'CONTRATADO', 'AVERIADO', 'MANTENIMIENTO', 'BAJA'], 'strict' => true],
			[['bastidor', 'matricula'], 'unique'],
			[['modelo_id'], 'exist', 'targetClass' => Modelo::className(), 'targetAttribute' => ['modelo_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelo()
    {
        return $this->hasOne(Modelo::className(), ['id' => 'modelo_id']);
    }

    /**
     * Gets query for [[VehiculoCaracteristicas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCaracteristicas()
    {
        return $this->hasOne(VehiculoCaracteristicas::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[VehiculoDelegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDelegacions()
    {
        return $this->hasMany(VehiculoDelegacion::className(), ['vehiculo_id' => 'id']);
    }

    /**
     * Gets query for [[\operacion\models\base\OrdenVehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenVehiculos()
    {
        return $this->hasMany(\operacion\models\base\OrdenVehiculo::className(), ['vehiculo_id' => 'id']);
    }

    /**
     * Gets query for [[\operacion\models\base\Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdens()
    {
        return $this->hasMany(\operacion\models\base\Orden::className(), ['id' => 'orden_id'])->via('ordenVehiculos');
    }

    /**
     * Gets query for [[\operacion\models\base\Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMovimientos()
    {
        return $this->hasMany(\operacion\models\base\Orden::className(), ['id' => 'orden_id'])->via('ordenVehiculos');
    }
}