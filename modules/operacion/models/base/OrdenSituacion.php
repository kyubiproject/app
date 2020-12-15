<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_situacion".
 *
 * Columns:
* @property integer $id  
* @property string $codigo  
* @property string $estado_orden  
* @property string|null $estado  
* @property integer|null $orden_id  
   
 *
 * Relations:
 * @property Orden $orden
 * @property OrdenSituacion $
 * @property OrdenSituacion $s
 */
class OrdenSituacion extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_situacion';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-situacion';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-situacion';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'codigo', 'estado_orden'], 'required'],
			[['id', 'orden_id'], 'integer'],
			[['codigo'], 'string', 'max' => 16],
			[['estado_orden'], 'in', 'range' => ['PRESUPUESTO', 'RESERVA', 'CONTRATO'], 'strict' => true],
			[['estado'], 'in', 'range' => ['EN VIGOR', 'ANULADO', 'FINALIZADO'], 'strict' => true],
			[['codigo'], 'unique'],
			[['id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['id' => 'id']],
			[['orden_id'], 'exist', 'targetClass' => OrdenSituacion::className(), 'targetAttribute' => ['orden_id' => 'id']]        
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
     * Gets query for [[OrdenSituacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function get()
    {
        return $this->hasOne(OrdenSituacion::className(), ['id' => 'orden_id']);
    }

    /**
     * Gets query for [[OrdenSituacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getS()
    {
        return $this->hasMany(OrdenSituacion::className(), ['orden_id' => 'id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'orden' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\Orden','refColumn'=>'id','column'=>'id'],
			'' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\OrdenSituacion','refColumn'=>'id','column'=>'orden_id'],
			's' => ['type'=>'hasMany','refClass'=>'operacion\\models\\base\\OrdenSituacion','refColumn'=>'orden_id','column'=>'id']
		];
	}
}