<?php

class WebUser extends CWebUser
{

    const CURRENT_USER = "@USER@";

    const COLUMNS = 'id, name, username, group, email';

    public $allowAutoLogin = true;

    public $autoRenewCookie = true;

    public $authTimeout = 3600 * 24 * 30;

    private $__current = [];

    /**
     *
     * @param mixed $user
     * @return integer
     */
    public function start($user = null)
    {
        if (! empty($params[':t0'] = $user)) {
            $user = db()->select(self::COLUMNS)
                ->from('backend__user')
                ->where(":t0 IN (id,username)")
                ->limit(1)
                ->queryRow(true, $params);
            if (isset($user['id'])) {
                $this->changeIdentity($user['id'], $user['name'], array_slice($user, 2));
                if (! $this->hasState(self::CURRENT_USER)) {
                    $this->setState(self::CURRENT_USER, $user['id']);
                }
                return $user['id'];
            }
        }
        return false;
    }

    /**
     * Retorna el listado de permisos del usuario indicado
     *
     * @param integer $userId
     * @param boolean $strict
     * @return array
     */
    public function access($userId = null, $strict = false)
    {
        $access = [];
        if (is_null($userId)) {
            $userId = $this->id;
        }
        if (is_numeric($userId)) {
            foreach (backendGetAccess($userId) as $row) {
                list ($moduleID, $controllerID) = explode('/', $row['route'], 2);
                $access[$moduleID][$controllerID] = str_to_array($row['actions']);
            }
            foreach (map_controllers() as $moduleID => $module) {
                $rules = [];
                foreach ($module as $name => $value) {
                    if (preg_match('/(ip|user|group)\@(allow|deny)/', $name)) {
                        $rules[$name] = $value;
                    }
                }
                if (filter_access($rules) === false) {
                    unset($access[$moduleID]);
                    continue;
                }
                foreach ($module['controllers'] as $controllerID => $controller) {
                    $controller = CMap::mergeArray($rules, $controller);
                    $fitler = filter_access($controller);
                    if ($fitler === false) {
                        unset($access[$moduleID][$controllerID]);
                    } elseif ($fitler === true) {
                        $access[$moduleID][$controllerID] = array_keys($controller['actions']);
                    } elseif (isset($access[$moduleID][$controllerID])) {
                        foreach ($access[$moduleID][$controllerID] as $name) {
                            if (isset($controller['actions'][$name])) {
                                $actions[] = $name;
                            }
                        }
                        if (isset($actions)) {
                            $access[$moduleID][$controllerID] = $actions;
                        }
                        unset($actions);
                    }
                }
            }
        }
        return $access;
    }

    /**
     * Registrar la petición del usuario
     *
     * @param integer $time_sql
     */
    public function log($time_sql = 0)
    {
        if (! $this->isGuest) {
            $columns['ip'] = request()->userHostAddress;
            $columns['url'] = url_strip(request()->getUrl());
            $columns['referrer'] = str_replace(request()->hostInfo . app()->baseUrl, null, request()->getUrlReferrer());
            switch ($columns['type'] = request()->getRequestType()) {
                case 'GET':
                    $columns['params'] = serialize($_GET);
                    break;
                case 'POST':
                    $columns['params'] = serialize($_POST);
                    break;
                default:
                    $columns['params'] = serialize(request()->getRawBody());
            }
            $columns['time_sql'] = round($time_sql, 3);
            $columns['time_php'] = round(microtime(true) - (YII_BEGIN_TIME + $time_sql), 3);
            $columns['time_exe'] = round(Yii::getLogger()->getExecutionTime(), 3);
            $columns['memory_kb'] = round(Yii::getLogger()->getMemoryUsage() / (1024 * 1024), 3);
            $columns['user__id'] = $this->id;
            // db()->insert('extra__activity', $columns);
        }
    }

    protected function restoreFromCookie()
    {
        $cookie = request()->getCookies()->itemAt($this->getStateKeyPrefix());
        if ($cookie && is_string($cookie->value) && ($pos = strpos($cookie->value, "a:1:{")) !== false) {
            $data = @unserialize(substr($cookie->value, $pos));
            if (is_array($data) && count($data)) {
                $this->start(array_shift($data));
                if ($this->autoRenewCookie) {
                    $this->saveToCookie($this->authTimeout);
                }
                $this->afterLogin(true);
            }
        }
    }

    public function currentUser()
    {
        return $this->getState(self::CURRENT_USER);
    }

    protected function saveToCookie($duration)
    {
        $cookie = $this->createIdentityCookie($this->getStateKeyPrefix());
        $cookie->expire = time() + $duration;
        $data[] = $this->getId();
        $cookie->value = app()->getSecurityManager()->hashData(serialize($data));
        request()->getCookies()->add($cookie->name, $cookie);
    }
}