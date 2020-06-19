<?php
/**
 * Table: backend__user.
 *
 * Attributes:
 * @property integer $id
 * @property string $username
 * @property string $group
 * @property string $name
 * @property string $email
 * @property string $password
 * @property string $token
 * @property array $status
 *
 * Relations:
 * @property Role[] roles
 */

class User extends ActiveRecord {

    protected $_table = 'backend__user';
    
    protected $_route = 'backend/user';
    
    protected $_config = 'backend.config.models.user';
    
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
	
	public function persistence() {
		$rules[] = ['username, group, status', 'required'];
		$rules[] = ['group', 'in', 'range' => ['ADMIN','USER','ROOT']];
		$rules[] = ['name', 'length', 'max' => 120];
		$rules[] = ['username', 'length', 'max' => 15];
		$rules[] = ['token', 'length', 'max' => 36];
		$rules[] = ['group', 'length', 'max' => 5];
		$rules[] = ['password', 'length', 'max' => 60];
		$rules[] = ['email', 'length', 'max' => 90];
		$rules[] = ['status', 'set', 'range' => ['ACTIVE','VERIFED','DISABLED','BANNED']];
		return $rules;
	}
	
	public function relations() {
		$relations['roles'] = [self::MANY_MANY, 'Role', 'backend__user_role(user__id,role__id)'];
		return $relations;
	}
	
	public function import() {
    	return [
			'backend.models.base.Role'
		];
    }

}