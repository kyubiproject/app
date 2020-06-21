<?php
namespace bcon\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bcon__source".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $type  
* @property integer|null $bcon__source__id  
   
 *
 * Relations:
 * @property \bexe\models\Egress[] $egresses
 * @property \bcon\models\Source $source
 * @property \bcon\models\Source[] $sources
 */
class Source extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bcon__source';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','name'], 'required'],
			[['id','bcon__source__id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['name'], 'string', 'max' => 64],
			[['type'], 'range', 'range' => ['INTERNAL', 'EXTERNAL'],'strict' => true],
			[['bcon__source__id'], 'exist', 'targetClass' => \bcon\models\Source::className(),'targetAttribute' => ['bcon__source__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bexe\models\Egress]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEgresses()
    {
        return $this->hasMany(\bexe\models\Egress::className(), ['bcon__source__id' => 'id']);
    }

    /**
     * Gets query for [[bcon\models\Source]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSource()
    {
        return $this->hasOne(\bcon\models\Source::className(), ['id' => 'bcon__source__id']);
    }

    /**
     * Gets query for [[bcon\models\Source]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSources()
    {
        return $this->hasMany(\bcon\models\Source::className(), ['bcon__source__id' => 'id']);
    }
}