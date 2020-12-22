<?php
namespace operacion\controllers\orden;

use kyubi\api\base\Action;
use kyubi\db\Query;

class NextAction extends Action
{

    public function run(string $id)
    {
        $query = Query::instance()->createCommand();
        $query->setRawSql(strtr('INSERT INTO operacion__orden (orden_id) VALUES (:t0)', [
            ':t0' => intval($id)
        ]));
        $query->execute();
        $id = $query->setRawSql('SELECT LAST_INSERT_ID();')->queryScalar();
        return controller()->redirect([
            '/operacion/' . (controller()->id == 'presupuesto' ? 'reserva' : 'contrato') . '/view',
            'id' => $id
        ]);
    }
}
