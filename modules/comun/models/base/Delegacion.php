<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__delegacion".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $descripcion  
* @property string|null $correo  
* @property string|null $telefono  
* @property string|null $whatsapp  
   
 *
 * Relations:
 * @property Oficina $oficinas
 * @property \flota\models\base\TarifaHistorico $tarifaHistoricos
 * @property \flota\models\base\Tarifa $tarifas
 * @property \flota\models\base\VehiculoDelegacion $vehiculoDelegacions
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
			[['id'], 'number'],
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
     * Gets query for [[\flota\models\base\TarifaHistorico]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifaHistoricos()
    {
        return $this->hasMany(\flota\models\base\TarifaHistorico::className(), ['delegacion_id' => 'id']);
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
     * Gets query for [[\flota\models\base\VehiculoDelegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculoDelegacions()
    {
        return $this->hasMany(\flota\models\base\VehiculoDelegacion::className(), ['delegacion_id' => 'id']);
    }

    /**
     * Gets query for [[\flota\models\base\Vehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculos()
    {
        return $this->hasMany(\flota\models\base\Vehiculo::className(), ['id' => 'vehiculo_id'])->viaTable('flota__vehiculo_delegacion', ['delegacion_id' => 'id']);
    }
}