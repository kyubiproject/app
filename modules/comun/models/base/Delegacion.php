<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__delegacion".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $whatsapp  
* @property string|null $telefono  
* @property string|null $correo  
   
 *
 * Relations:
 * @property Oficina[] $oficinas
 * @property \flota\models\base\Vehiculo[] $vehiculos
 */
class Delegacion extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'comun/config/models/delegacion';

    /**
     *
     * @var string
     */
    protected static $_table = 'comun__delegacion';

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
			[['whatsapp', 'telefono'], 'string', 'max' => 20]        
        ];
    }

    /**
     * Gets query for [[Oficina]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOficinas()
    {
        return $this->hasMany(Oficina::className(), ['delegacion__id' => 'id']);
    }

    /**
     * Gets query for [[Oficina]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculos()
    {
        return $this->hasMany(Oficina::className(), ['delegacion__id' => 'id']);
    }
}