<?php
namespace common\models;

use kyubi\base\ActiveRecord;

/**
 * This is the model class for table "common_info".
 *
 * Columns:
* @property integer $id  
* @property string $address  
* @property string|null $email {"rules":["unique"]} 
* @property boolean $is_company {"list":{"es":["Inactivo","Activo"],"en":["Inactive","Active"]}} 
   
 *
 * Relations:
 * @property \bude\models\Beneficiary $beneficiary
 * @property \common\models\Company $company
 * @property \common\models\Person $person
 * @property \common\models\Phone[] $phones
 */
class Info extends ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'common_info';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function persistence(): array
    {
        return [
			[['address','is_company'], 'required'],
			[['id'], 'is', 'type' => 'int'],
			[['address'], 'string', 'max' => 300],
			[['email'], 'string', 'max' => 100],
			[['is_company'], 'boolean']        
        ];
    }

    /**
     * Gets query for [[bude\models\Beneficiary]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBeneficiary()
    {
        return $this->hasOne(\bude\models\Beneficiary::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Company]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCompany()
    {
        return $this->hasOne(\common\models\Company::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Person]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPerson()
    {
        return $this->hasOne(\common\models\Person::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[common\models\Phone]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPhones()
    {
        return $this->hasMany(\common\models\Phone::className(), ['common_info__id' => 'id']);
    }
}