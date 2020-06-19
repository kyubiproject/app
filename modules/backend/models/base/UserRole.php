<?php
/**
 * Table: backend__user_role.
 *
 * Attributes:
 * @property integer $role__id
 * @property integer $user__id
 */

class UserRole extends ActiveRecord {

    protected $_table = 'backend__user_role';
    
    protected $_route = 'backend/userRole';
    
    protected $_config = 'backend.config.models.user_role';
    
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
	
	public function primaryKey() {
		return ['role__id','user__id'];
	}

	public function persistence() {
		$rules[] = ['role__id, user__id', 'required'];
		$rules[] = ['role__id', 'length', 'max' => 3];
		$rules[] = ['user__id', 'length', 'max' => 5];
		$rules[] = ['role__id', 'numerical'];
		$rules[] = ['user__id', 'numerical', 'min' => 0, 'max' => MAX_SMALLINT];
		return $rules;
	}
	
}