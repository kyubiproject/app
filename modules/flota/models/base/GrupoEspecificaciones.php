<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__grupo_especificaciones".
 *
 * Columns:
* @property string $id  
* @property integer|null $plazas  
* @property integer|null $puertas  
* @property string|null $transmision  
* @property boolean|null $aire  
* @property float|null $fianza  
* @property float|null $franquicia  
   
 *
 * Relations:
 * @property Grupo $grupo
 */
class GrupoEspecificaciones extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/grupoespecificaciones';

    /**
     *
     * @var string
     */
    protected static $_table = 'flota__grupo_especificaciones';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/grupoespecificaciones';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id'], 'required'],
			[['id'], 'string', 'max' => 3],
			[['plazas', 'puertas'], 'is', 'type' => 'tinyint'],
			[['fianza', 'franquicia'], 'is', 'type' => 'float', 'size' => '7, 2'],
			[['transmision'], 'in', 'range' => ['MANUAL', 'AUTOMATIC', 'DUAL'], 'strict' => true],
			[['aire'], 'boolean'],
			[['id'], 'exist', 'targetClass' => Grupo::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Grupo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGrupo()
    {
        return $this->hasOne(Grupo::className(), ['id' => 'id']);
    }
}