<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo".
 *
 * Columns:
* @property string $matricula  
* @property string|null $fecha_matricula  
* @property string|null $bastidor  
* @property integer|null $modelo_id  
   
 *
 * Relations:
 * @property Modelo $modelo
 * @property VehiculoCaracteristicas $caracteristicas
 * @property VehiculoObservacion $observacion
 * @property VehiculoSituacion $situacion
 * @property \operacion\models\base\OrdenHistoria $ordenHistorias
 * @property \operacion\models\base\OrdenVehiculo $ordenVehiculos
 * @property VehiculoHistoria $historias
 */
class Vehiculo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__vehiculo';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/vehiculo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/vehiculo';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['matricula'], 'required'],
			[['matricula'], 'string', 'max' => 10],
			[['bastidor'], 'string', 'max' => 30],
			[['fecha_matricula'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['modelo_id'], 'integer'],
			[['bastidor', 'matricula'], 'unique'],
			[['modelo_id'], 'exist', 'targetClass' => Modelo::className(), 'targetAttribute' => ['modelo_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelo()
    {
        return $this->hasOne(Modelo::className(), ['id' => 'modelo_id']);
    }

    /**
     * Gets query for [[VehiculoCaracteristicas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCaracteristicas()
    {
        return $this->hasOne(VehiculoCaracteristicas::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[VehiculoObservacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getObservacion()
    {
        return $this->hasOne(VehiculoObservacion::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[VehiculoSituacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSituacion()
    {
        return $this->hasOne(VehiculoSituacion::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[\operacion\models\base\OrdenHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenHistorias()
    {
        return $this->hasMany(\operacion\models\base\OrdenHistoria::className(), ['vehiculo_matricula' => 'matricula']);
    }

    /**
     * Gets query for [[\operacion\models\base\OrdenVehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenVehiculos()
    {
        return $this->hasMany(\operacion\models\base\OrdenVehiculo::className(), ['vehiculo_matricula' => 'matricula']);
    }

    /**
     * Gets query for [[VehiculoHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getHistorias()
    {
        return $this->hasMany(VehiculoHistoria::className(), ['vehiculo_id' => 'id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'modelo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Modelo','refColumn'=>'id','column'=>'modelo_id'],
			'caracteristicas' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\VehiculoCaracteristicas','refColumn'=>'id','column'=>'id'],
			'observacion' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\VehiculoObservacion','refColumn'=>'id','column'=>'id'],
			'situacion' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\VehiculoSituacion','refColumn'=>'id','column'=>'id'],
			'ordenHistorias' => ['type'=>'hasMany','refClass'=>'operacion\\models\\base\\OrdenHistoria','refColumn'=>'vehiculo_matricula','column'=>'matricula'],
			'ordenVehiculos' => ['type'=>'hasMany','refClass'=>'operacion\\models\\base\\OrdenVehiculo','refColumn'=>'vehiculo_matricula','column'=>'matricula'],
			'historias' => ['type'=>'hasMany','refClass'=>'flota\\models\\base\\VehiculoHistoria','refColumn'=>'vehiculo_id','column'=>'id']
		];
	}
}