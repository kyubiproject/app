<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_vehiculo".
 *
 * Columns:
* @property integer $id  
* @property string|null $vehiculo_matricula  
* @property integer|null $km  
* @property integer|null $combustible  
* @property string|null $detalle  
   
 *
 * Relations:
 * @property Orden $orden
 * @property \flota\models\base\Vehiculo $vehiculo
 */
class OrdenVehiculo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_vehiculo';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-vehiculo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-vehiculo';

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
			[['vehiculo_matricula'], 'string', 'max' => 10],
			[['id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['id' => 'id']],
			[['vehiculo_matricula'], 'exist', 'targetClass' => \flota\models\base\Vehiculo::className(), 'targetAttribute' => ['vehiculo_matricula' => 'matricula']]        
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
     * Gets query for [[\flota\models\base\Vehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculo()
    {
        return $this->hasOne(\flota\models\base\Vehiculo::className(), ['matricula' => 'vehiculo_matricula']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'orden' => ['type'=>'hasOne','refClass'=>'operacion\\models\\base\\Orden','refColumn'=>'id','column'=>'id'],
			'vehiculo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Vehiculo','refColumn'=>'matricula','column'=>'vehiculo_matricula']
		];
	}
}