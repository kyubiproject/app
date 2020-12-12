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
* @property boolean|null $plazas  
* @property boolean|null $puertas  
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
			[['id'], 'number'],
			[['color'], 'string', 'max' => 20],
			[['anio'], 'is', 'type' => 'year'],
			[['plazas', 'puertas'], 'is', 'type' => 'tinyint'],
			[['transmision'], 'in', 'range' => ['MANUAL', 'AUTOMATICO', 'DUAL'], 'strict' => true],
			[['extra'], 'in', 'range' => ['GPS', 'AIRE', '4X4', 'MULTIMEDIA', 'ALARMA']],
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
}