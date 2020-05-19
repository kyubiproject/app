<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Franquicia".
 *
 * @property int $id
 * @property string|null $Nombre
 * @property string|null $Grupo
 * @property string|null $Grupo_Agrupacion
 * @property string|null $SEUR_ZonaComercial
 * @property int|null $Provincia_ID
 * @property string $updated_at
 */
class Franquicia extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Franquicia';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Provincia_ID'], 'integer'],
            [['updated_at'], 'safe'],
            [['Nombre', 'Grupo', 'Grupo_Agrupacion', 'SEUR_ZonaComercial'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'Nombre' => Yii::t('app', 'Nombre'),
            'Grupo' => Yii::t('app', 'Grupo'),
            'Grupo_Agrupacion' => Yii::t('app', 'Grupo Agrupacion'),
            'SEUR_ZonaComercial' => Yii::t('app', 'Seur Zona Comercial'),
            'Provincia_ID' => Yii::t('app', 'Provincia ID'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
