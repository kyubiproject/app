<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden".
 *
 * Columns:
* @property integer $id  
* @property string $tipo_contrato  
* @property integer $tarifa_id  
* @property string|null $fecha_entrega  
* @property string|null $fecha_recogida  
* @property string $fecha_alta  
* @property string|null $fecha_baja  
* @property integer $cliente_id  
   
 *
 * Relations:
 * @property \comun\models\base\Cliente $cliente
 * @property \tarifa\models\base\Tarifa $tarifa
 * @property OrdenDocument $documents
 * @property \flota\models\base\Vehiculo $vehiculos
 */
class Orden extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tipo_contrato', 'tarifa_id', 'cliente_id'], 'required'],
			[['id', 'tarifa_id', 'cliente_id'], 'number'],
			[['tipo_contrato'], 'in', 'range' => ['CORTO', 'LARGO'], 'strict' => true],
			[['fecha_entrega', 'fecha_recogida', 'fecha_alta', 'fecha_baja'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss'],
			[['cliente_id'], 'exist', 'targetClass' => \comun\models\base\Cliente::className(), 'targetAttribute' => ['cliente_id' => 'id']],
			[['tarifa_id'], 'exist', 'targetClass' => \tarifa\models\base\Tarifa::className(), 'targetAttribute' => ['tarifa_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\comun\models\base\Cliente]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCliente()
    {
        return $this->hasOne(\comun\models\base\Cliente::className(), ['id' => 'cliente_id']);
    }

    /**
     * Gets query for [[\tarifa\models\base\Tarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifa()
    {
        return $this->hasOne(\tarifa\models\base\Tarifa::className(), ['id' => 'tarifa_id']);
    }

    /**
     * Gets query for [[OrdenDocument]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDocuments()
    {
        return $this->hasMany(OrdenDocument::className(), ['orden_id' => 'id']);
    }

    /**
     * Gets query for [[OrdenDocument]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculos()
    {
        return $this->hasMany(OrdenDocument::className(), ['orden_id' => 'id']);
    }
}