<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo_delegacion".
 *
 * Columns:
* @property integer $vehiculo_id  
* @property integer $delegacion_id  
   
 *
 * Relations:
 * @property \comun\models\base\Delegacion $delegacion
 * @property Vehiculo $vehiculo
 */
class VehiculoDelegacion extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__vehiculo_delegacion';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/vehiculo-delegacion';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/vehiculo-delegacion';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['vehiculo_id', 'delegacion_id'], 'required'],
			[['vehiculo_id', 'delegacion_id'], 'number'],
			[['delegacion_id', 'vehiculo_id'], 'unique', 'targetAttribute' => ['delegacion_id', 'vehiculo_id']],
			[['delegacion_id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']],
			[['vehiculo_id'], 'exist', 'targetClass' => Vehiculo::className(), 'targetAttribute' => ['vehiculo_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\comun\models\base\Delegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDelegacion()
    {
        return $this->hasOne(\comun\models\base\Delegacion::className(), ['id' => 'delegacion_id']);
    }

    /**
     * Gets query for [[\comun\models\base\Delegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculo()
    {
        return $this->hasOne(\comun\models\base\Delegacion::className(), ['id' => 'delegacion_id']);
    }
}