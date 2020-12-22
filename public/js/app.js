var planning = {

    // API
    api: {
        filters: "data/filters",
        data: "data"
    },
    
    // Peticiones iniciales
    data: null,
    filters: null,

    // Resultados filtrados
    dataFiltered: [],

    // Inicializar app
    init() {

        this.showNodata(false);
        this.showError(false);
        this.showLoading(true);

        $.get(this.api.filters, (data) => {

            this.filters = data.data;

            this.initFilters();
            this.search();

        })
        .fail(() => {
            this.showError(true);
            this.showLoading(false);
        });

    },

    // Inicializar filtros
    initFilters() {
        // Filtro delegacion
        var formDelegacion = '';
        this.filters.delegaciones.forEach(delegacion => {
            formDelegacion += '<option value="' + delegacion.value + '">' + delegacion.label + '</option>';
        });

        // Filtro grupos
        var formGrupos = '<option value="all">Todos</option>';
        this.filters.grupos.forEach(grupo => {
            formGrupos += '<option value="' + grupo.value + '">' + grupo.label + '</option>';
        });

        $('#formDate').val(this.currentDate());
        $('#formDelegacion').html(formDelegacion);
        $('#formGrupos').html(formGrupos);

        // Eventos Botones
        $('#formFilters').off().on('input', () => {
            this.search();
        });

        $('#resetFilter').off().on('click', () => {
            this.resetFilters();
        });
    },

    // Inicializar tabla head
    initTableHead() {

        var content = '<tr>';

        this.data.headers
        .filter(f => !f.hasOwnProperty("date"))
        .forEach((header) => {
            var css = header.label;
            css += header.festivo ? ' festivo' : '';
            css += header.current_day ? ' current-day' : '';
            content += '<th scope="col" class="' + css + '">' + header.label + '</th>';
        });

        // Filtro fecha y Dias
        var filtro_dias = $('#formDias').val();
        var filtro_fecha = $('#formDate').val();
        
        let headers_date = this.data.headers.filter(f => f.hasOwnProperty("date"))
        var index_day = headers_date.findIndex(f => f.date == filtro_fecha);
        
        if (!!~index_day) {

            headers_date.slice(index_day, index_day + +filtro_dias)
            .forEach((header) => {
                var css = 'dia ';
                css += header.festivo ? 'festivo' : '';
                css += header.current_day ? 'current-day' : '';
                content += '<th scope="col" class="' + css + '">' + header.label + '</th>';
            });
        }

        content += '</tr>';

        $('#planning-table').find('thead').html("");
        $('#planning-table').find('thead').html(content);
    },

    // Inicializar tabla body
    initTableBody() {

        var content = '';

        // Generar cuerpo
        this.dataFiltered.forEach((cont) => {
            
            var available = '';
            if(!cont.available) {
                available += 'not-available';
            }

            content += '<tr>';
            content += '<td scope="row" class="matricula">' + cont.matricula + '</td>';
            content += '<td scope="row" class="modelo">' + cont.modelo + '</td>';
            content += '<td scope="row" class="grupo">' + cont.grupo + '</td>';
            content += '<td scope="row" class="estado '+ available +'">' + cont.estado + '</td>';

            // Filtro fecha y Dias
            var filtro_dias = $('#formDias').val();
            var filtro_fecha = $('#formDate').val();
            var index_day = cont.calendar.findIndex(f => f.date == filtro_fecha);
            
            if (!!~index_day) {

                cont.calendar.slice(index_day, index_day + +filtro_dias ).forEach((day) => {

                    var css = '';

                    // Festivo
                    var festivo = this.data.headers.find(f => f.value == day.value).festivo
                    if (festivo) {
                        css += 'festivo ';
                    }
                    
                    // Dia actual
                    var current = this.data.headers.find(f => f.value == day.value).current_day
                    if (current) {
                        css += 'current-day ';
                    }
                    
                    // Reserva
                    switch(day.booking) {
                        case 0:
                            css += 'booking-start ';
                            break;

                        case 1:
                        case 3:
                            css += 'booking ';
                            break;

                        case 2:
                            css += 'booking-end ';
                            break;

                        default:
                            css += '';
                    }

                    // Contrato
                    switch(day.contract) {
                        case 0:
                            css += 'contract-start ';
                            break;

                        case 1:
                        case 3:
                            css += 'contract ';
                            break;

                        case 2:
                            css += 'contract-end ';
                            break;

                        default:
                            css += '';
                    }
                    
                    content += '<td scope="row" class="dia ' + css + '">';

                        
                        if(day.hasOwnProperty('booking') || day.hasOwnProperty('contract')) {

                            content += '<a href="' + day.link + '" target="_blank"><button type="button" data-toggle="tooltip" data-html="true" title="' + day.tooltip + '" class="btn btn-default">';
                            
                            var type = 'C';
                            var estado = day.contract
                            if (day.hasOwnProperty('booking')) {
                                type = 'R';
                                estado = day.booking;
                            }

                            switch(estado) {
                                case 0:
                                    content += type + ' <i class="fas fa-long-arrow-alt-right"></i>';
                                    break;

                                case 1:
                                    content += type;
                                    break;

                                case 2:
                                    content += type + ' <i class="fas fa-long-arrow-alt-left"></i>';
                                    break;
                                
                                default:
                                    content += type + ' <i class="fas fa-compress-alt"></i>';
                            }
                            
                            content += '</button></a>';

                        } else {
                            content += '<input type="text" class="form-control "value="' + day.label + '" readonly></input>';
                        }

                    content += '</td>';
                
                });
            }
            
            content += '</tr>';
        });

        $('#planning-table').find('tbody').html('');
        $('#planning-table').find('tbody').html(content);

        $('[data-toggle="tooltip"]').tooltip();
    },

    // Buscar
    search() {

        var filter = {}

        var filtro_delegacion = $('#formDelegacion').val();
        if (filtro_delegacion) filter.delegacion = filtro_delegacion;

        var filtro_fecha = $('#formDate').val();
        if (filtro_fecha) filter.fecha = filtro_fecha;

        var filtro_grupo = $('#formGrupos').val();
        if (filtro_grupo) filter.grupo = filtro_grupo;

        var filtro_buscar = $('#formSearch').val();
        if (filtro_buscar) filter.buscar = filtro_buscar;

        var filtro_dias = $('#formSearch').val();
        if (filtro_dias) filter.dias = filtro_dias;

        this.showError(false);
        this.showLoading(true);
        this.showNodata(false);

        $.get(this.api.data + '?' + this.queryParams(filter) , (data) => {

            this.data = data.data;
            this.dataFiltered = data.data.content;

            /* TESTING */
            /*this.data = data.data;

            this.dataFiltered = this.data.content.filter((cont) => {

                var sameDelegacion = cont.delegacion_id == filtro_delegacion;
                var sameGrupo = (filtro_grupo !== 'all') ? cont.grupo_id == filtro_grupo : true;
                var searchMatriculaModelo = filtro_buscar ? (cont.matricula.toLowerCase().includes(filtro_buscar) || cont.modelo.toLowerCase().includes(filtro_buscar)) : true;
                var includeDate = cont.calendar.some(s => s.date == filtro_fecha);

                return sameDelegacion && sameGrupo && searchMatriculaModelo && includeDate;

            });*/

           
            if (!this.dataFiltered.length) {
                this.showNodata(true)
            }
            
            this.initTableHead();
            this.initTableBody();  
            
            this.showLoading(false);

        }).fail(() => {
            this.showError(true);
            this.showLoading(false);
        });
        
    },

    // Utils
    currentDate() {

        var now = new Date();
        var day = ("0" + now.getDate()).slice(-2);
        var month = ("0" + (now.getMonth() + 1)).slice(-2);
        var today = now.getFullYear()+"-"+(month)+"-"+(day);

        return today;
    },
    resetFilters() {
        this.initFilters();
        this.search();
    },
    queryParams(params) {
        return Object.keys(params).map(key => key + '=' + params[key]).join('&');
    },
    showNodata(open) {
        if(open) {
            $('#nodata').show();
        } else {
            $('#nodata').hide();
        }
    },
    showError(open) {
        if(open) {
            $('#error').show();
        } else {
            $('#error').hide();
        }
    },
    showLoading(open) {
        if(open) {
            $('#spinner').show();
        } else {
            $('#spinner').hide();
        }
    }
}