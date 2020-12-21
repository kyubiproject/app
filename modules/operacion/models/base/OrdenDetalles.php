<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_detalles".
 *
 * Columns:
* @property integer $id  
* @property string $fecha_entrega  
* @property string|null $hora_entrega  
* @property boolean|null $entrega_directa  
* @property string $fecha_recogida  
* @property string|null $hora_recogida  
* @property boolean|null $recogida_directa  
* @property string|null $comisionista  
* @property integer|null $vehiculo_id  
   
 *
 * Relations:
 * @property Orden $orden
 * @property \flota\models\base\Vehiculo $vehiculo
 */
class OrdenDetalles extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_detalles';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-detalles';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-detalles';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'fecha_entrega', 'fecha_recogida'], 'required'],
			[['id', 'vehiculo_id'], 'integer'],
			[['fecha_entrega', 'fecha_recogida'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['hora_entrega', 'hora_recogida'], 'date', 'type' => 'time', 'format' => 'HH:mm:ss'],
			[['entrega_directa', 'recogida_directa'], 'boolean'],
			[['comisionista'], 'string', 'max' => 100],
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