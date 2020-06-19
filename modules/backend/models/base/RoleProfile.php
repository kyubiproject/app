<?php
/**
 * Table: backend__role_profile.
 *
 * Attributes:
 * @property integer $role__id
 * @property integer $profile__id
 */

class RoleProfile extends ActiveRecord {

    protected $_table = 'backend__role_profile';
    
    protected $_route = 'backend/roleProfile';
    
    protected $_config = 'backend.config.models.role_profile';
    
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
	
	public function primaryKey() {
		return ['role__id','profile__id'];
	}

	public function persistence() {
		$rules[] = ['role__id, profile__id', 'required'];
		$rules[] = ['role__id', 'length', 'max' => 3];
		$rules[] = ['profile__id', 'length', 'max' => 4];
		$rules[] = ['role__id', 'numerical'];
		$rules[] = ['profile__id', 'numerical', 'min' => 0, 'max' => MAX_SMALLINT];
		return $rules;
	}
	
}