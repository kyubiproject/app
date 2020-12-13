<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo_movimiento".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $descripcion  
* @property string|null $fecha  
* @property boolean|null $combustible  
* @property integer|null $km  
* @property string $estado  
* @property string $fecha_estado  
* @property string|null $contrato_numero  
* @property integer $vehiculo_id  
   
 *
 * Relations:
 * @property \operacion\models\base\Document $document
 * @property Vehiculo $vehiculo
 * @property \operacion\models\base\OrdenMovimiento $ordenMovimientos
 * @property \operacion\models\base\OrdenVehiculo $ordenVehiculos
 */
class VehiculoMovimiento extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__vehiculo_movimiento';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/vehiculo-movimiento';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/vehiculo-movimiento';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre', 'estado', 'vehiculo_id'], 'required'],
			[['id', 'km', 'vehiculo_id'], 'number'],
			[['nombre'], 'string', 'max' => 100],
			[['contrato_numero'], 'string', 'max' => 16],
			[['fecha'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['fecha_estado'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss'],
			[['combustible'], 'is', 'type' => 'tinyint'],
			[['estado'], 'in', 'range' => ['DISPONIBLE', 'RESERVADO', 'CONTRATADO', 'AVERIADO', 'MANTENIMIENTO', 'BAJA', 'ENTREGADO', 'RECIBIDO', 'RENOVADO', 'SISTEMA'], 'strict' => true],
			[['vehiculo_id'], 'exist', 'targetClass' => Vehiculo::className(), 'targetAttribute' => ['vehiculo_id' => 'id']],
			[['contrato_numero'], 'exist', 'targetClass' => \operacion\models\base\Document::className(), 'targetAttribute' => ['contrato_numero' => 'codigo']]        
        ];
    }

    /**
     * Gets query for [[\operacion\models\base\Document]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDocument()
    {
        return $this->hasOne(\operacion\models\base\Document::className(), ['codigo' => 'contrato_numero']);
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
     * Gets query for [[\operacion\models\base\OrdenMovimiento]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenMovimientos()
    {
        return $this->hasMany(\operacion\models\base\OrdenMovimiento::className(), ['movimiento_id' => 'id']);
    }

    /**
     * Gets query for [[\operacion\models\base\OrdenVehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenVehiculos()
    {
        return $this->hasMany(\operacion\models\base\OrdenVehiculo::className(), ['id' => 'orden_vehiculo_id'])->viaTable('operacion__orden_movimiento', ['movimiento_id' => 'id']);
    }
}