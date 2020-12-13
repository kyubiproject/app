<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__modelo".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $descripcion  
* @property integer|null $marca_id  
   
 *
 * Relations:
 * @property Marca $marca
 * @property ModeloCaracteristicas $caracteristicas
 * @property ModeloCarga $carga
 * @property Tipo $tipos
 * @property Vehiculo $vehiculos
 */
class Modelo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__modelo';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/modelo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/modelo';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre'], 'required'],
			[['id', 'marca_id'], 'number'],
			[['nombre'], 'string', 'max' => 100],
			[['marca_id'], 'exist', 'targetClass' => Marca::className(), 'targetAttribute' => ['marca_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Marca]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMarca()
    {
        return $this->hasOne(Marca::className(), ['id' => 'marca_id']);
    }

    /**
     * Gets query for [[ModeloCaracteristicas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCaracteristicas()
    {
        return $this->hasOne(ModeloCaracteristicas::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[ModeloCarga]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCarga()
    {
        return $this->hasOne(ModeloCarga::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[Tipo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipos()
    {
        return $this->hasMany(Tipo::className(), ['id' => 'tipo_id'])->viaTable('flota__modelo_tipo', ['modelo_id' => 'id']);
    }

    /**
     * Gets query for [[Vehiculo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculos()
    {
        return $this->hasMany(Vehiculo::className(), ['modelo_id' => 'id']);
    }
}