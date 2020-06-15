<?php
namespace budp\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "budp_category".
 *
 * Columns:
* @property integer $id  
* @property string $code {"rules":["uniqueMix"]} 
* @property integer $position {"rules":["uniqueMix","min:1","max:10"]} 
* @property string|null $name  
* @property string|null $note  
* @property boolean $is_active {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
   
 *
 * Relations:
 * @property \budp\models\CategoryUnity[] $categoryUnities
 * @property \budf\models\Certificate[] $certificates
 * @property \common\models\Level $level
 * @property \budp\models\Unity[] $unities
 */
class Category extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'budp_category';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['id','code','position','is_active'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['position'], 'is', 'type' => 'tinyint'],
			[['code'], 'string', 'max' => 20],
			[['name'], 'string', 'max' => 100],
			[['note'], 'string', 'max' => 500],
			[['is_active'], 'boolean'],
			[{'{\'targetAttribute\':[\'code\',\'position\']}':'is_active'}, 'unique'],
			[['id'], 'exist', 'targetClass' => \common\models\Level::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[budp\models\CategoryUnity]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategoryUnities()
    {
        return $this->hasMany(\budp\models\CategoryUnity::className(), ['budp_category__id' => 'id']);
    }

    /**
     * Gets query for [[budf\models\Certificate]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCertificates()
    {
        return $this->hasMany(\budf\models\Certificate::className(), ['budp_category__id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Level]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLevel()
    {
        return $this->hasOne(\common\models\Level::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[budp\models\Unity]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUnities()
    {
        return $this->hasMany(\budp\models\Unity::className(), ['id' => 'budp_unity__id'])->via('categoryUnities');
    }
}