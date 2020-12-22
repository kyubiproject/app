<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_recogida".
 *
 * Columns:
* @property integer $id  
* @property string|null $fecha  
* @property string|null $hora  
* @property integer|null $km  
* @property integer|null $combustible  
* @property string|null $descripcion  
   
 *
 * Relations:
 * @property Orden $orden
 */
class OrdenRecogida extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_recogida';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-recogida';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-recogida';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id'], 'required'],
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