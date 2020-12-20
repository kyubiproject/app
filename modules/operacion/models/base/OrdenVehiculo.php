<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_vehiculo".
 *
 * Columns:
* @property integer $id  
* @property integer $vehiculo_id  
* @property string $fecha_entrega  
* @property string $fecha_recogida  
* @property string $momento  
   
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
			[['id', 'vehiculo_id', 'fecha_entrega', 'fecha_recogida'], 'required'],
			[['id', 'vehiculo_id'], 'integer'],
			[['fecha_entrega', 'fecha_recogida'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['momento'], 'in', 'range' => ['RESERVA', 'CONTRATO'], 'strict' => true],
			[['id'], 'unique'],
			[['id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['id' => 'id']],
			[['vehiculo_id'], 'exist', 'targetClass' => \flota\models\base\Vehiculo::className(), 'targetAttribute' => ['vehiculo_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrden()
    {
        return $this->hasOne(Orden::className(), ['id' => 'id']);
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
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'orden' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\Orden','refColumn'=>'id','column'=>'id'],
			'vehiculo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Vehiculo','refColumn'=>'id','column'=>'vehiculo_id']
		];
	}
}