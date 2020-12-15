<?php
namespace opreacion\models\base;

/**
 * This is the model class for table "opreacion_orden_tarifa".
 *
 * Columns:
* @property integer $id  
* @property integer|null $tarifa_id  
   
 *
 * Relations:
 * @property \operacion\models\base\Orden $orden
 * @property \flota\models\base\TarifaHistoria $tarifaHistoria
 */
class OrdenTarifa extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'opreacion_orden_tarifa';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'opreacion/config/models/orden-tarifa';

    /**
     *
     * @var string
     */
    protected static $_lang = 'opreacion/lang/models/orden-tarifa';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id'], 'required'],
			[['id', 'tarifa_id'], 'integer'],
			[['id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['id' => 'id']],
			[['tarifa_id'], 'exist', 'targetClass' => \flota\models\base\TarifaHistoria::className(), 'targetAttribute' => ['tarifa_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\operacion\models\base\Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrden()
    {
        return $this->hasOne(\operacion\models\base\Orden::className(), ['id' => 'id']);
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
			'orden' => ['type'=>'hasOne','refClass'=>'\\operacion\\models\\base\\Orden','refColumn'=>'id','column'=>'id'],
			'tarifaHistoria' => ['type'=>'hasOne','refClass'=>'\\flota\\models\\base\\TarifaHistoria','refColumn'=>'id','column'=>'tarifa_id']
		];
	}
}