<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo".
 *
 * Columns:
* @property string $matricula  
* @property string|null $fecha_matricula  
* @property string|null $bastidor  
* @property integer|null $modelo_id  
* @property integer|null $delegacion_id  
   
 *
 * Relations:
 * @property \comun\models\base\Delegacion $delegacion
 * @property Modelo $modelo
 * @property VehiculoCaracteristicas $caracteristicas
 * @property VehiculoObservacion $observacion
 * @property VehiculoSituacion $situacion
 * @property VehiculoHistoria $historias
 */
class Vehiculo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__vehiculo';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/vehiculo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/vehiculo';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['matricula'], 'required'],
			[['matricula'], 'string', 'max' => 10],
			[['bastidor'], 'string', 'max' => 30],
			[['fecha_matricula'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['modelo_id', 'delegacion_id'], 'number'],
			[['modelo_id', 'delegacion_id'], 'integer'],
			[['bastidor', 'matricula'], 'unique'],
			[['modelo_id'], 'exist', 'targetClass' => Modelo::className(), 'targetAttribute' => ['modelo_id' => 'id']],
			[['delegacion_id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\comun\models\base\Delegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDelegacion()
    {
        return $this->hasOne(\comun\models\base\Delegacion::className(), ['id' => 'delegacion_id']);
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelo()
    {
        return $this->hasOne(Modelo::className(), ['id' => 'modelo_id']);
    }

    /**
     * Gets query for [[VehiculoCaracteristicas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCaracteristicas()
    {
        return $this->hasOne(VehiculoCaracteristicas::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[VehiculoObservacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getObservacion()
    {
        return $this->hasOne(VehiculoObservacion::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[VehiculoSituacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSituacion()
    {
        return $this->hasOne(VehiculoSituacion::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[VehiculoHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getHistorias()
    {
        return $this->hasMany(VehiculoHistoria::className(), ['vehiculo_id' => 'id']);
    }
}