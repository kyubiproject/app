<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__tipo".
 *
 * Columns:
* @property string $id  
* @property string $nombre  
* @property string|null $descripcion  
* @property string|null $tipo_vehiculo  
* @property float|null $fianza  
* @property float|null $franquicia  
   
 *
 * Relations:
 * @property ModeloTipo $modeloTipos
 * @property Modelo $modelos
 * @property \tarifa\models\base\TarifaTipo $tarifaTipos
 * @property \tarifa\models\base\Tarifa $tarifas
 */
class Tipo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__tipo';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/tipo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/tipo';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'nombre'], 'required'],
			[['id'], 'string', 'max' => 3],
			[['nombre'], 'string', 'max' => 100],
			[['tipo_vehiculo'], 'in', 'range' => ['COMERCIAL', 'ESPECIAL', 'MONOVOLUMEN', 'TODOTERRENO', 'TURISMO'], 'strict' => true],
			[['fianza', 'franquicia'], 'is', 'type' => 'float', 'size' => '7, 2']        
        ];
    }

    /**
     * Gets query for [[ModeloTipo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModeloTipos()
    {
        return $this->hasMany(ModeloTipo::className(), ['tipo_id' => 'id']);
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelos()
    {
        return $this->hasMany(Modelo::className(), ['id' => 'modelo_id'])->viaTable('flota__modelo_tipo', ['tipo_id' => 'id']);
    }

    /**
     * Gets query for [[\tarifa\models\base\TarifaTipo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifaTipos()
    {
        return $this->hasMany(\tarifa\models\base\TarifaTipo::className(), ['tipo_id' => 'id']);
    }

    /**
     * Gets query for [[\tarifa\models\base\Tarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifas()
    {
        return $this->hasMany(\tarifa\models\base\Tarifa::className(), ['id' => 'tarifa_id'])->viaTable('tarifa__tarifa_tipo', ['tipo_id' => 'id']);
    }
}