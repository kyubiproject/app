<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__tipo".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $clase  
* @property string|null $descripcion  
   
 *
 * Relations:
 * @property Familia[] $familias
 */
class Tipo extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/tipo';

    /**
     *
     * @var string
     */
    protected static $_table = 'flota__tipo';

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
			[['nombre'], 'required'],
			[['id'], 'is', 'type' => 'tinyint'],
			[['nombre'], 'string', 'max' => 100],
			[['clase'], 'string', 'max' => 50]        
        ];
    }

    /**
     * Gets query for [[Familia]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFamilias()
    {
        return $this->hasMany(Familia::className(), ['tipo__id' => 'id']);
    }
}