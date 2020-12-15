<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_observacion".
 *
 * Columns:
* @property integer $id  
* @property string|null $observacion  
   
 *
 * Relations:
 * @property Orden $orden
 */
class OrdenObservacion extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_observacion';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-observacion';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-observacion';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id'], 'required'],
			[['id'], 'integer'],
			[['id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['id' => 'id']]        
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
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'orden' => ['type'=>'hasOne','refClass'=>'Orden','refColumn'=>'id','column'=>'id']
		];
	}
}