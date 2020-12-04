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
 */
class Tarifa extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'flota__tarifa';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'grupo__id', 'hasta', 'periodo'], 'required'],
			[['grupo__id'], 'string', 'max' => 3],
			[['grupo__id'], 'exist', 'targetClass' => Grupo::className(), 'targetAttribute' => ['grupo__id' => 'id']]        
        ];
    }
}