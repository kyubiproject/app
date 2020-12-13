<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_movimiento".
 *
 * Columns:
* @property integer $orden_vehiculo_id  
* @property integer $movimiento_id  
   
 *
 * Relations:
 * @property OrdenVehiculo $ordenVehiculo
 * @property \flota\models\base\VehiculoMovimiento $vehiculoMovimiento
 */
class OrdenMovimiento extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_movimiento';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-movimiento';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-movimiento';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['orden_vehiculo_id', 'movimiento_id'], 'required'],
			[['orden_vehiculo_id', 'movimiento_id'], 'number'],
			[['movimiento_id', 'orden_vehiculo_id'], 'unique', 'targetAttribute' => ['movimiento_id', 'orden_vehiculo_id']],
			[['movimiento_id'], 'exist', 'targetClass' => \flota\models\base\VehiculoMovimiento::className(), 'targetAttribute' => ['movimiento_id' => 'id']],
			[['orden_vehiculo_id'], 'exist', 'targetClass' => OrdenVehiculo::className(), 'targetAttribute' => ['orden_vehiculo_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[OrdenVehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenVehiculo()
    {
        return $this->hasOne(OrdenVehiculo::className(), ['id' => 'orden_vehiculo_id']);
    }

    /**
     * Gets query for [[\flota\models\base\VehiculoMovimiento]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculoMovimiento()
    {
        return $this->hasOne(\flota\models\base\VehiculoMovimiento::className(), ['id' => 'movimiento_id']);
    }
}