<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_detalles".
 *
 * Columns:
* @property integer $id  
* @property string|null $vehiculo__matricula  
* @property string $fecha_entrega  
* @property string $fecha_recogida  
   
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
    protected static $_config = 'operacion/config/models/ordendetalles';

    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_detalles';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/ordendetalles';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'fecha_entrega', 'fecha_recogida'], 'required'],
			[['id'], 'string', 'max' => 8],
			[['vehiculo__matricula'], 'string', 'max' => 10],
			[['fecha_entrega', 'fecha_recogida'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['id' => 'id']],
			[['vehiculo__matricula'], 'exist', 'targetClass' => \flota\models\base\Vehiculo::className(), 'targetAttribute' => ['vehiculo__matricula' => 'matricula']]        
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
     * Gets query for [[Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculo()
    {
        return $this->hasOne(Orden::className(), ['id' => 'id']);
    }
}