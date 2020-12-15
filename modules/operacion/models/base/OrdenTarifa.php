<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion_orden_tarifa".
 *
 * Columns:
* @property integer $id  
* @property integer|null $tarifa_id  
   
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
    protected static $_table = 'operacion_orden_tarifa';
    
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
			[['id'], 'required'],
			[['id', 'tarifa_id'], 'integer'],
			[['id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['id' => 'id']],
			[['tarifa_id'], 'exist', 'targetClass' => \flota\models\base\TarifaHistoria::className(), 'targetAttribute' => ['tarifa_id' => 'id']]        
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
			'orden' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\Orden','refColumn'=>'id','column'=>'id'],
			'tarifaHistoria' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\TarifaHistoria','refColumn'=>'id','column'=>'tarifa_id']
		];
	}
}