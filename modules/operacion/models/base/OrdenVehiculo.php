<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_vehiculo".
 *
 * Columns:
* @property integer $id  
* @property integer $orden_id  
* @property integer $vehiculo_id  
   
 *
 * Relations:
 * @property Orden $orden
 * @property \flota\models\base\Vehiculo $vehiculo
 * @property OrdenMovimiento $ordenMovimientos
 * @property \flota\models\base\VehiculoMovimiento $vehiculoMovimientos
 */
class OrdenVehiculo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_vehiculo';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-vehiculo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-vehiculo';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['orden_id', 'vehiculo_id'], 'required'],
			[['id', 'orden_id', 'vehiculo_id'], 'number'],
			[['orden_id', 'vehiculo_id'], 'unique', 'targetAttribute' => ['orden_id', 'vehiculo_id']],
			[['vehiculo_id'], 'exist', 'targetClass' => \flota\models\base\Vehiculo::className(), 'targetAttribute' => ['vehiculo_id' => 'id']],
			[['orden_id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['orden_id' => 'id']]        
        ];
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
     * Gets query for [[\flota\models\base\Vehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculo()
    {
        return $this->hasOne(\flota\models\base\Vehiculo::className(), ['id' => 'vehiculo_id']);
    }

    /**
     * Gets query for [[OrdenMovimiento]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenMovimientos()
    {
        return $this->hasMany(OrdenMovimiento::className(), ['orden_vehiculo_id' => 'id']);
    }

    /**
     * Gets query for [[\flota\models\base\VehiculoMovimiento]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculoMovimientos()
    {
        return $this->hasMany(\flota\models\base\VehiculoMovimiento::className(), ['id' => 'movimiento_id'])->viaTable('operacion__orden_movimiento', ['orden_vehiculo_id' => 'id']);
    }
}