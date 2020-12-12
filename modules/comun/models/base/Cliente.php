<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__cliente".
 *
 * Columns:
* @property integer $id  
* @property array $tipo  
* @property string|null $observacion  
   
 *
 * Relations:
 * @property Persona $persona
 * @property Conductor $conductors
 * @property \operacion\models\base\Orden $ordens
 */
class Cliente extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'comun__cliente';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'comun/config/models/cliente';

    /**
     *
     * @var string
     */
    protected static $_lang = 'comun/lang/models/cliente';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'tipo'], 'required'],
			[['id'], 'number'],
			[['tipo'], 'in', 'range' => ['PERSONA', 'EMPRESA']],
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
     * Gets query for [[Conductor]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getConductors()
    {
        return $this->hasMany(Conductor::className(), ['id' => 'conductor_id'])->viaTable('comun__cliente_conductor', ['cliente_id' => 'id']);
    }

    /**
     * Gets query for [[Conductor]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdens()
    {
        return $this->hasMany(Conductor::className(), ['id' => 'conductor_id'])->viaTable('', ['' => '']);
    }
}