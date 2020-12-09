<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__modelo".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $descripcion  
* @property integer|null $familia__id  
* @property integer|null $potencia  
* @property string|null $combustible  
* @property integer|null $combustible_cap  
* @property integer|null $marca__id  
   
 *
 * Relations:
 * @property Familia $familia
 * @property Marca $marca
 * @property Vehiculo[] $vehiculos
 */
class Modelo extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/modelo';

    /**
     *
     * @var string
     */
    protected static $_table = 'flota__modelo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/modelo';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre'], 'required'],
			[['id', 'familia__id', 'marca__id'], 'number'],
			[['nombre'], 'string', 'max' => 100],
			[['potencia', 'combustible_cap'], 'is', 'type' => 'tinyint'],
			[['combustible'], 'in', 'range' => ['GAS', 'DIESEL', 'ELECTRIC', 'HYBRID'], 'strict' => true],
			[['marca__id'], 'exist', 'targetClass' => Marca::className(), 'targetAttribute' => ['marca__id' => 'id']],
			[['familia__id'], 'exist', 'targetClass' => Familia::className(), 'targetAttribute' => ['familia__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Familia]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFamilia()
    {
        return $this->hasOne(Familia::className(), ['id' => 'familia__id']);
    }

    /**
     * Gets query for [[Marca]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMarca()
    {
        return $this->hasOne(Marca::className(), ['id' => 'marca__id']);
    }

    /**
     * Gets query for [[Marca]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculos()
    {
        return $this->hasOne(Marca::className(), ['id' => 'marca__id']);
    }
}