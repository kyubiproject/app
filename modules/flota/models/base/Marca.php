<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__marca".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $descripcion  
* @property string|null $correo  
* @property string|null $telefono  
   
 *
 * Relations:
 * @property Modelo $modelos
 */
class Marca extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__marca';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'marca';

    /**
     *
     * @var string
     */
    protected static $_lang = 'marca';

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
			[['telefono'], 'string', 'max' => 20]        
        ];
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelos()
    {
        return $this->hasMany(Modelo::className(), ['marca_id' => 'id']);
    }
}