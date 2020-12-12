<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__conductor".
 *
 * Columns:
* @property integer $id  
* @property string $carnet  
* @property string|null $carnet_pais  
* @property string|null $fecha_expedicion  
* @property string|null $fecha_vencimiento  
   
 *
 * Relations:
 * @property Persona $persona
 * @property ClienteConductor $clienteConductors
 * @property Cliente $clientes
 */
class Conductor extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'comun__conductor';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'comun/config/models/conductor';

    /**
     *
     * @var string
     */
    protected static $_lang = 'comun/lang/models/conductor';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'carnet'], 'required'],
			[['id'], 'number'],
			[['carnet'], 'string', 'max' => 20],
			[['carnet_pais'], 'string', 'max' => 45],
			[['fecha_expedicion', 'fecha_vencimiento'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['carnet', 'carnet_pais'], 'unique', 'targetAttribute' => ['carnet', 'carnet_pais']],
			[['id'], 'exist', 'targetClass' => Persona::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Persona]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPersona()
    {
        return $this->hasOne(Persona::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[ClienteConductor]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getClienteConductors()
    {
        return $this->hasMany(ClienteConductor::className(), ['conductor_id' => 'id']);
    }

    /**
     * Gets query for [[ClienteConductor]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getClientes()
    {
        return $this->hasMany(ClienteConductor::className(), ['conductor_id' => 'id']);
    }
}