<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__delegacion".
 *
 * Columns:
* @property string $nombre  
* @property string|null $descripcion  
* @property string|null $correo  
* @property string|null $telefono  
* @property string|null $whatsapp  
   
 *
 * Relations:
 * @property Oficina $oficinas
 * @property \operacion\models\base\OrdenHistoria $ordenHistorias
 * @property \operacion\models\base\Orden $ordens
 * @property \flota\models\base\TarifaHistoria $tarifaHistorias
 * @property \flota\models\base\Tarifa $tarifas
 * @property \flota\models\base\VehiculoHistoria $vehiculoHistorias
 * @property \flota\models\base\VehiculoSituacion $vehiculoSituacions
 * @property \flota\models\base\Vehiculo $vehiculos
 */
class Delegacion extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'comun__delegacion';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'comun/config/models/delegacion';

    /**
     *
     * @var string
     */
    protected static $_lang = 'comun/lang/models/delegacion';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre'], 'required'],
			[['nombre', 'correo'], 'string', 'max' => 100],
			[['telefono', 'whatsapp'], 'string', 'max' => 20]        
        ];
    }

    /**
     * Gets query for [[Oficina]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOficinas()
    {
        return $this->hasMany(Oficina::className(), ['delegacion_id' => 'id']);
    }

    /**
     * Gets query for [[\operacion\models\base\OrdenHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenHistorias()
    {
        return $this->hasMany(\operacion\models\base\OrdenHistoria::className(), ['delegacion_id' => 'id']);
    }

    /**
     * Gets query for [[\operacion\models\base\Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdens()
    {
        return $this->hasMany(\operacion\models\base\Orden::className(), ['delegacion_id' => 'id']);
    }

    /**
     * Gets query for [[\flota\models\base\TarifaHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifaHistorias()
    {
        return $this->hasMany(\flota\models\base\TarifaHistoria::className(), ['delegacion_id' => 'id']);
    }

    /**
     * Gets query for [[\flota\models\base\Tarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifas()
    {
        return $this->hasMany(\flota\models\base\Tarifa::className(), ['delegacion_id' => 'id']);
    }

    /**
     * Gets query for [[\flota\models\base\VehiculoHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculoHistorias()
    {
        return $this->hasMany(\flota\models\base\VehiculoHistoria::className(), ['delegacion_id' => 'id']);
    }

    /**
     * Gets query for [[\flota\models\base\VehiculoSituacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculoSituacions()
    {
        return $this->hasMany(\flota\models\base\VehiculoSituacion::className(), ['delegacion_id' => 'id']);
    }

    /**
     * Gets query for [[\flota\models\base\Vehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculos()
    {
        return $this->hasMany(\flota\models\base\Vehiculo::className(), ['delegacion_id' => 'id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'oficinas' => ['type'=>'hasMany','refClass'=>'comun\\models\\base\\Oficina','refColumn'=>'delegacion_id','column'=>'id'],
			'ordenHistorias' => ['type'=>'hasMany','refClass'=>'operacion\\models\\base\\OrdenHistoria','refColumn'=>'delegacion_id','column'=>'id'],
			'ordens' => ['type'=>'hasMany','refClass'=>'operacion\\models\\base\\Orden','refColumn'=>'delegacion_id','column'=>'id'],
			'tarifaHistorias' => ['type'=>'hasMany','refClass'=>'flota\\models\\base\\TarifaHistoria','refColumn'=>'delegacion_id','column'=>'id'],
			'tarifas' => ['type'=>'hasMany','refClass'=>'flota\\models\\base\\Tarifa','refColumn'=>'delegacion_id','column'=>'id'],
			'vehiculoHistorias' => ['type'=>'hasMany','refClass'=>'flota\\models\\base\\VehiculoHistoria','refColumn'=>'delegacion_id','column'=>'id'],
			'vehiculoSituacions' => ['type'=>'hasMany','refClass'=>'flota\\models\\base\\VehiculoSituacion','refColumn'=>'delegacion_id','column'=>'id'],
			'vehiculos' => ['type'=>'hasMany','refClass'=>'flota\\models\\base\\Vehiculo','refColumn'=>'delegacion_id','column'=>'id']
		];
	}
}