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
 * @property ModeloCaracteristicas $modeloCaracteristicas
 * @property ModeloCarga $modeloCarga
 * @property \tarifa\models\base\GrupoModelo $grupoModelos
 * @property \tarifa\models\base\Grupo $grupos
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
    protected static $_config = 'modelo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'modelo';

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
    public function getModelocaracteristicas()
    {
        return $this->hasOne(ModeloCaracteristicas::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[ModeloCarga]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelocarga()
    {
        return $this->hasOne(ModeloCarga::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[\tarifa\models\base\GrupoModelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGrupomodelos()
    {
        return $this->hasMany(\tarifa\models\base\GrupoModelo::className(), ['modelo_id' => 'id']);
    }

    /**
     * Gets query for [[\tarifa\models\base\Grupo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGrupos()
    {
        return $this->hasMany(\tarifa\models\base\Grupo::className(), ['id' => 'grupo_id'])->via('grupoModelos');
    }

    /**
     * Gets query for [[\tarifa\models\base\Grupo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculos()
    {
        return $this->hasMany(\tarifa\models\base\Grupo::className(), ['id' => 'grupo_id'])->via('grupoModelos');
    }
}