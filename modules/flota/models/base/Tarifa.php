<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__tarifa".
 *
 * Columns:
* @property integer $id  
* @property string $grupo__id  
* @property integer $hasta  
* @property string $periodo  
   
 *
 * Relations:
 * @property Grupo $grupo
 * @property TarifaItem[] $tarifaItems
 */
class Tarifa extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/tarifa';

    /**
     *
     * @var string
     */
    protected static $_table = 'flota__tarifa';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/tarifa';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'grupo__id', 'hasta', 'periodo'], 'required'],
			[['id'], 'number'],
			[['grupo__id'], 'string', 'max' => 3],
			[['hasta'], 'is', 'type' => 'tinyint'],
			[['periodo'], 'in', 'range' => ['H', 'D', 'M'], 'strict' => true],
			[['grupo__id'], 'exist', 'targetClass' => Grupo::className(), 'targetAttribute' => ['grupo__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Grupo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGrupo()
    {
        return $this->hasOne(Grupo::className(), ['id' => 'grupo__id']);
    }

    /**
     * Gets query for [[Grupo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifaItems()
    {
        return $this->hasOne(Grupo::className(), ['id' => 'grupo__id']);
    }
}