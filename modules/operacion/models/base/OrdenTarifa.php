<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_tarifa".
 *
 * Columns:
* @property integer $orden_id  
* @property integer $tarifa_id  
* @property integer|null $periodo  
* @property integer|null $fraccion  
* @property string|null $fecha_inicio  
* @property string|null $fecha_fin  
* @property string|null $fecha_entrega  
* @property string|null $fecha_recogida  
   
 *
 * Relations:
 * @property Orden $orden
 * @property \flota\models\base\TarifaHistoria $tarifaHistoria
 */
class OrdenTarifa extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_tarifa';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-tarifa';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-tarifa';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['orden_id', 'tarifa_id'], 'required'],
			[['orden_id', 'tarifa_id', 'periodo', 'fraccion'], 'integer'],
			[['fecha_inicio', 'fecha_fin', 'fecha_entrega', 'fecha_recogida'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['tarifa_id'], 'exist', 'targetClass' => \flota\models\base\TarifaHistoria::className(), 'targetAttribute' => ['tarifa_id' => 'id']],
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
     * Gets query for [[\flota\models\base\TarifaHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifaHistoria()
    {
        return $this->hasOne(\flota\models\base\TarifaHistoria::className(), ['id' => 'tarifa_id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'orden' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\Orden','refColumn'=>'id','column'=>'orden_id'],
			'tarifaHistoria' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\TarifaHistoria','refColumn'=>'id','column'=>'tarifa_id']
		];
	}
}