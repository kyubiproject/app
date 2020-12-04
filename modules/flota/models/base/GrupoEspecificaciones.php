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
 */
class GrupoEspecificaciones extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'flota__grupo_especificaciones';
    }

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
			[['aire'], 'boolean'],
			[['aire'], 'default', 'value' => 0],
			[['id'], 'exist', 'targetClass' => Grupo::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }
}