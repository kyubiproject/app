<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo_caracteristicas".
 *
 * Columns:
* @property integer $id  
* @property string|null $color  
* @property integer|null $anio  
* @property string|null $transmision  
* @property integer|null $plazas  
* @property integer|null $puertas  
* @property array|null $extra  
   
 *
 * Relations:
 * @property Vehiculo $vehiculo
 */
class VehiculoCaracteristicas extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__vehiculo_caracteristicas';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/vehiculo-caracteristicas';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/vehiculo-caracteristicas';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id'], 'required'],
			[['id', 'plazas', 'puertas'], 'integer'],
			[['color'], 'string', 'max' => 20],
			[['anio'], 'string', 'max' => 4],
			[['transmision'], 'in', 'range' => ['MANUAL', 'AUTOMATICO', 'DUAL'], 'strict' => true],
			[['extra'], 'in', 'range' => ['GPS', 'AIRE', '4X4', 'MULTIMEDIA', 'ALARMA'], 'allowArray' => true],
			[['id'], 'exist', 'targetClass' => Vehiculo::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Vehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculo()
    {
        return $this->hasOne(Vehiculo::className(), ['id' => 'id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'vehiculo' => ['type'=>'hasOne','refClass'=>'Vehiculo','refColumn'=>'id','column'=>'id']
		];
	}
}