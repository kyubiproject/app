<?php
use yii\db\Migration;

/**
 * Handles the creation of table `{{%metadata__data}}`.
 */
class m201126_080327_create_metadata__data_table extends Migration
{

    /**
     *
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('metadata__data', [
            'id' => $this->string()
                ->notNull(),
            'object' => $this->string()
                ->notNull(),
            'data' => $this->binary()
        ]);
        $this->execute(strtr('ALTER TABLE :table ADD PRIMARY KEY (:columns)', [
            ':table' => 'metadata__data',
            ':columns' => implode(', ', [
                'id',
                'object'
            ])
        ]));
    }

    /**
     *
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('metadata__data');
    }
}
