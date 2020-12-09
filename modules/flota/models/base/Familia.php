<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__familia".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string $descripcion  
* @property integer|null $tipo__id  
   
 *
 * Relations:
 * @property Modelo[] $modelos
 * @property Tipo $tipo
 */
class Familia extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/familia';

    /**
     *
     * @var string
     */
    protected static $_table = 'flota__familia';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/familia';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre', 'descripcion'], 'required'],
			[['id'], 'number'],
			[['nombre'], 'string', 'max' => 100],
			[['tipo__id'], 'is', 'type' => 'tinyint'],
			[['tipo__id'], 'exist', 'targetClass' => Tipo::className(), 'targetAttribute' => ['tipo__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelos()
    {
        return $this->hasMany(Modelo::className(), ['familia__id' => 'id']);
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipo()
    {
        return $this->hasMany(Modelo::className(), ['familia__id' => 'id']);
    }
}