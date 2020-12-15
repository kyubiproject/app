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
 * @property Modelo $modelos
 * @property TarifaHistoria $tarifaHistorias
 * @property Tarifa $tarifas
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
			[['fianza', 'franquicia'], 'number']        
        ];
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelos()
    {
        return $this->hasMany(Modelo::className(), ['tipo_id' => 'id']);
    }

    /**
     * Gets query for [[TarifaHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifaHistorias()
    {
        return $this->hasMany(TarifaHistoria::className(), ['tipo_id' => 'id']);
    }

    /**
     * Gets query for [[Tarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifas()
    {
        return $this->hasMany(Tarifa::className(), ['tipo_id' => 'id']);
    }
}