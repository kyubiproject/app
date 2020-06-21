<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__egress".
 *
 * Columns:
* @property integer $id  
* @property integer $bcon__category__id  
* @property integer $bcon__spending__id  
* @property integer|null $bcon__source__id  
* @property integer $period  
* @property string $distribution  
* @property double|null $amount  
   
 *
 * Relations:
 * @property \bcon\models\Category $category
 * @property \bexe\models\ModificationBalance[] $modificationBalances
 * @property \bexe\models\MomentBalance[] $momentBalances
 * @property \bcon\models\Source $source
 * @property \bcon\models\Spending $spending
 */
class Egress extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__egress';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['bcon__category__id','bcon__spending__id','period','distribution'], 'required'],
			[['id','bcon__category__id','bcon__spending__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['bcon__source__id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['period'], 'is', 'type' => "year"],
			[['amount'], 'is', 'type' => "double",'size' => null],
			[['distribution'], 'range', 'range' => ['1', '2', '3', '6', '12'],'strict' => true],
			[{'{\'targetAttribute\':[\'bcon__category__id\',\'bcon__source__id\',\'bcon__spending__id\',\'period\']}':'amount'}, 'unique'],
			[['bcon__spending__id'], 'exist', 'targetClass' => \bcon\models\Spending::className(),'targetAttribute' => ['bcon__spending__id' => id]],
			[['bcon__category__id'], 'exist', 'targetClass' => \bcon\models\Category::className(),'targetAttribute' => ['bcon__category__id' => id]],
			[['bcon__source__id'], 'exist', 'targetClass' => \bcon\models\Source::className(),'targetAttribute' => ['bcon__source__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bcon\models\Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(\bcon\models\Category::className(), ['id' => 'bcon__category__id']);
    }

    /**
     * Gets query for [[bexe\models\ModificationBalance]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModificationBalances()
    {
        return $this->hasMany(\bexe\models\ModificationBalance::className(), ['bexe__egress__id' => 'id']);
    }

    /**
     * Gets query for [[bexe\models\MomentBalance]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMomentBalances()
    {
        return $this->hasMany(\bexe\models\MomentBalance::className(), ['bexe__egress__id' => 'id']);
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
     * Gets query for [[bcon\models\Spending]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSpending()
    {
        return $this->hasOne(\bcon\models\Spending::className(), ['id' => 'bcon__spending__id']);
    }
}