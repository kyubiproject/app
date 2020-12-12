<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_vehiculo".
 *
 * Columns:
* @property integer $orden_id  
* @property integer $vehiculo_id  
   
 *
 * Relations:
 * @property Orden $orden
 * @property \flota\models\base\Vehiculo $vehiculo
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
			[['orden_id', 'vehiculo_id'], 'number'],
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
     * Gets query for [[Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculo()
    {
        return $this->hasOne(Orden::className(), ['id' => 'orden_id']);
    }
}