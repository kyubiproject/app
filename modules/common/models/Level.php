<?php
namespace common\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "common_level".
 *
 * Columns:
* @property integer $id  
* @property integer $code  
* @property integer|null $common_level__id  
* @property integer $common_rank__id  
   
 *
 * Relations:
 * @property \budp\models\Account $account
 * @property \budp\models\Category $category
 * @property \common\models\Level $level
 * @property \common\models\Level[] $levels
 * @property \rrhh\models\Position $position
 * @property \common\models\Rank $rank
 * @property \budp\models\Sorter $sorter
 * @property \budp\models\Territory $territory
 */
class Level extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_level';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['code','common_rank__id'], 'required'],
			[['id','common_level__id','common_rank__id'], 'is', 'type' => 'int'],
			[['code'], 'is', 'type' => 'tinyint', 'unsigned' => true],
			[['common_level__id'], 'exist', 'targetClass' => \common\models\Level::className(), 'targetAttribute' => ['common_level__id' => 'id']],
			[['common_rank__id'], 'exist', 'targetClass' => \common\models\Rank::className(), 'targetAttribute' => ['common_rank__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[budp\models\Account]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAccount()
    {
        return $this->hasOne(\budp\models\Account::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[budp\models\Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(\budp\models\Category::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Level]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLevel()
    {
        return $this->hasOne(\common\models\Level::className(), ['id' => 'common_level__id']);
    }

    /**
     * Gets query for [[common\models\Level]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLevels()
    {
        return $this->hasMany(\common\models\Level::className(), ['common_level__id' => 'id']);
    }

    /**
     * Gets query for [[rrhh\models\Position]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPosition()
    {
        return $this->hasOne(\rrhh\models\Position::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Rank]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRank()
    {
        return $this->hasOne(\common\models\Rank::className(), ['id' => 'common_rank__id']);
    }

    /**
     * Gets query for [[budp\models\Sorter]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSorter()
    {
        return $this->hasOne(\budp\models\Sorter::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[budp\models\Territory]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTerritory()
    {
        return $this->hasOne(\budp\models\Territory::className(), ['id' => 'id']);
    }
}