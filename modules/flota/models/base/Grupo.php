<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__grupo".
 *
 * Columns:
* @property string $id  
* @property string $nombre  
* @property string|null $caracteristicas  
   
 *
 * Relations:
 * @property GrupoEspecificaciones $grupoEspecificaciones
 * @property \operacion\models\base\Orden[] $ordens
 * @property Tarifa[] $tarifas
 */
class Grupo extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/grupo';

    /**
     *
     * @var string
     */
    protected static $_table = 'flota__grupo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/grupo';

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
			[['nombre'], 'string', 'max' => 100]        
        ];
    }

    /**
     * Gets query for [[GrupoEspecificaciones]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGrupoEspecificaciones()
    {
        return $this->hasOne(GrupoEspecificaciones::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[\operacion\models\base\Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdens()
    {
        return $this->hasMany(\operacion\models\base\Orden::className(), ['grupo__id' => 'id']);
    }

    /**
     * Gets query for [[\operacion\models\base\Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifas()
    {
        return $this->hasMany(\operacion\models\base\Orden::className(), ['grupo__id' => 'id']);
    }
}