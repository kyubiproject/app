<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo_observacion".
 *
 * Columns:
* @property integer $id  
* @property string|null $observacion  
   
 *
 * Relations:
 * @property Vehiculo $vehiculo
 */
class VehiculoObservacion extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__vehiculo_observacion';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/vehiculo-observacion';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/vehiculo-observacion';

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