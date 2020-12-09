<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden".
 *
 * Columns:
* @property integer $id  
* @property string $tipo  
* @property string|null $cliente  
* @property string|null $contrato  
* @property string|null $periodo  
* @property string|null $grupo__id  
* @property string|null $estado  
* @property string $fecha_alta  
   
 *
 * Relations:
 * @property \flota\models\base\Grupo $grupo
 * @property OrdenDetalles $ordenDetalles
 * @property Presupuesto $presupuesto
 */
class Orden extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden';

    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden';

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
			[['id', 'tipo'], 'required'],
			[['id'], 'string', 'max' => 8],
			[['cliente'], 'string', 'max' => 100],
			[['grupo__id'], 'string', 'max' => 3],
			[['tipo'], 'in', 'range' => ['PRESUPUESTO', 'RESERVA', 'CONTRATO'], 'strict' => true],
			[['contrato'], 'in', 'range' => ['CORTO', 'LARGO'], 'strict' => true],
			[['periodo'], 'in', 'range' => ['H', 'D', 'M'], 'strict' => true],
			[['estado'], 'in', 'range' => ['EN VIGOR', 'ANULADO', 'FINALIZADO'], 'strict' => true],
			[['fecha_alta'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss'],
			[['grupo__id'], 'exist', 'targetClass' => \flota\models\base\Grupo::className(), 'targetAttribute' => ['grupo__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\flota\models\base\Grupo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGrupo()
    {
        return $this->hasOne(\flota\models\base\Grupo::className(), ['id' => 'grupo__id']);
    }

    /**
     * Gets query for [[OrdenDetalles]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenDetalles()
    {
        return $this->hasOne(OrdenDetalles::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[OrdenDetalles]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPresupuesto()
    {
        return $this->hasOne(OrdenDetalles::className(), ['id' => 'id']);
    }
}