<?php
$data['menu'] = [
    [
        'label' => 'Flota',
        'items' => [
            [
                'label' => 'Vehículos',
                'url' => '#'
            ],
            [
                'label' => 'ITV',
                'url' => '#',
                'disabled' => true
            ],
            '-',
            [
                'label' => 'Planing',
                'url' => '#'
            ],
            '-',
            'Mantenimientos',
            [
                'label' => 'Marcas de vehículo',
                'url' => '#',
                'disabled' => true
            ],
            [
                'label' => 'Modelos de vehículo',
                'url' => '#',
                'disabled' => true
            ],
            [
                'label' => 'Famílias de vehículo',
                'url' => '#',
                'disabled' => true
            ],
            [
                'label' => 'Tipos de vehículo',
                'url' => '#',
                'disabled' => true
            ],
            '-',
            [
                'label' => 'Grupo de tarificación',
                'url' => '#',
                'disabled' => true
            ],
            [
                'label' => 'Tipos de combustible',
                'url' => '#',
                'disabled' => true
            ]
        ]
    ],
    [
        'label' => 'Clientes',
        'items' => [
            [
                'label' => 'Clientes',
                'url' => '#'
            ],
            '-',
            [
                'label' => 'Facturas cliente',
                'url' => '#'
            ],
            '-',
            [
                'label' => 'Cobros',
                'url' => '#'
            ],
            [
                'label' => 'Remesas cliente',
                'url' => '#'
            ],
            '-',
            'Informes',
            [
                'label' => 'Factura acumulada',
                'url' => '#',
                'disabled' => true
            ]
        ]
    ]
];
$data['user'] = [
    'role' => 'Administrador',
    'username' => 'usuario',
    'company' => 'Empresa - Localidad'
];
return $data;