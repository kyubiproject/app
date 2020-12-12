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
    protected static $_config = 'delegacion';

    /**
     *
     * @var string
     */
    protected static $_lang = 'delegacion';

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
     * Gets query for [[\flota\models\base\VehiculoDelegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculodelegacions()
    {
        return $this->hasMany(\flota\models\base\VehiculoDelegacion::className(), ['delegacion_id' => 'id']);
    }

    /**
     * Gets query for [[\flota\models\base\VehiculoDelegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculos()
    {
        return $this->hasMany(\flota\models\base\VehiculoDelegacion::className(), ['delegacion_id' => 'id']);
    }
}