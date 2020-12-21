<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_entrega".
 *
 * Columns:
* @property integer $id  
* @property string $fecha  
* @property string $hora  
* @property integer $km  
* @property integer $combustible  
* @property string|null $detalle  
   
 *
 * Relations:
 * @property Orden $orden
 */
class OrdenEntrega extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_entrega';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-entrega';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-entrega';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'fecha', 'hora', 'km', 'combustible'], 'required'],
			[['id', 'km', 'combustible'], 'integer'],
			[['fecha'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['hora'], 'date', 'type' => 'time', 'format' => 'HH:mm:ss'],
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
			'orden' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\Orden','refColumn'=>'id','column'=>'id']
		];
	}
}