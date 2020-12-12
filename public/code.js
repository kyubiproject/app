
 $(document).ready(function() {
             $("#car-pro").change(function () {
                $("#car-select-ofi").prop('disabled', false);
                if (this.value == 08) {
                    $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=08 >Almería</OPTION><OPTION value=06 >Almería - Antas</OPTION><OPTION value=07 >Almería - El Ejido</OPTION>");
                }
                else if (this.value == 14) {
                    $("#car-select-ofi").html("<OPTION value=14 >Barcelona</OPTION>");
                }
                else if (this.value == 25 ) {
                    $("#car-select-ofi").html("<OPTION value=25 >Burgos</OPTION>");
                }
                else if (this.value == 28) {
                    $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=28 >Córdoba</OPTION><OPTION value=36 >Palma del río</OPTION><OPTION value=37 >Pozoblanco</OPTION><OPTION value=41 >Lucena</OPTION>");
                }
                else if (this.value == 20) {
                    $("#car-select-ofi").html("<OPTION value=20 >Granada</OPTION>");
                }
                else if (this.value == 02) {
                    $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=02 >Madrid - San Fernando</OPTION><OPTION value=43 >Madrid - Griñón</OPTION>");
                }
                else if (this.value == 21) {
                    $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=21 >Málaga</OPTION><OPTION value=23 >Málaga - Estepona</OPTION>");
                }
                else if (this.value == 29) {
                    $("#car-select-ofi").html("<OPTION value=29 >Sevilla</OPTION>");
                } 
                else if (this.value == 30) {
                    $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=30 >San Sebastian - Oiartzun</OPTION><OPTION value=32 >San Sebastian - Arrasate</OPTION><OPTION value=33 >San Sebastian - Irun</OPTION>");
                } 
                else if (this.value == 31) 
                {
                    $("#car-select-ofi").html("<OPTION value=31 >Galdakao</OPTION>");
                } 
                else if (this.value == 42) 
                {
                    $("#car-select-ofi").html("<OPTION value=42 >Santander</OPTION>");
                }
                else if (this.value == 44) 
                {
                    $("#car-select-ofi").html("<OPTION value=42>Gijón</OPTION>");
                }
                else if (this.value == 47) 
                {
                    $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=47>Murcia - San Pedro del Pinatar</OPTION><OPTION value=48>Murcia - Balsicas</OPTION><OPTION value=49>Murcia - Los Ramos</OPTION>><OPTION value=52>Murcia - San Javier</OPTION>");
                }
                else if (this.value == 45) 
                {
                    $("#car-select-ofi").html("<OPTION value=45 >Pontevedra - Vilagracia</OPTION>");
                }
                else 
                {
                    $("#car-select-ofi").prop('disabled', true);
                    $("#car-select-ofi").html("<OPTION value=0 selected>Oficina</OPTION>");
                }
            });

          $("#car-select-ofi").prop('disabled', false);
                    if ($("#car-pro").val() == 08) {
                        $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=08 >Almería</OPTION><OPTION value=06 >Almería - Antas</OPTION><OPTION value=07 >Almería - El Ejido</OPTION>");
                    }
                    else if ($("#car-pro").val() == 14) {
                        $("#car-select-ofi").html("<OPTION value=14 >Barcelona</OPTION>");
                    }
                    else if ($("#car-pro").val() == 24) {
                        $("#car-select-ofi").html("<OPTION value=24 >Burgos</OPTION>");
                    }
                    else if ($("#car-pro").val() == 28) {
                        $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=28 >Córdoba</OPTION><OPTION value=36 >Palma del río</OPTION><OPTION value=37 >Pozoblanco</OPTION><OPTION value=41 >Lucena</OPTION>");
                    }
                    else if ($("#car-pro").val() == 20) {
                        $("#car-select-ofi").html("<OPTION value=20 >Granada</OPTION>");
                    }
                    else if ($("#car-pro").val() == 02) {
                        $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=02 >Madrid - San Fernando</OPTION><OPTION value=43 >Madrid - Griñón</OPTION>");
                    }
                    else if ($("#car-pro").val() == 21) {
                        $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=21 >Málaga</OPTION><OPTION value=23 >Málaga - Estepona</OPTION>");
                    }
                    else if ($("#car-pro").val() == 29) {
                        $("#car-select-ofi").html("<OPTION value=29 >Sevilla</OPTION>");
                    }
                    else if (this.value == 30) {
                        $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=30 >San Sebastian - Oiartzun</OPTION><OPTION value=32 >San Sebastian - Arrasate</OPTION><OPTION value=33 >San Sebastian - Irun</OPTION>");
                    } 
                    else if (this.value == 31) 
                    {
                        $("#car-select-ofi").html("<OPTION value=31 >Galdakao</OPTION>");
                    }
                    else if (this.value == 42) 
                    {
                        $("#car-select-ofi").html("<OPTION value=42 >Santander</OPTION>");
                    }
                    else if (this.value == 44) 
                    {
                       $("#car-select-ofi").html("<OPTION value=42>Gijón</OPTION>");
                    }
                    else if (this.value == 47) 
                    {
                        $("#car-select-ofi").html("<OPTION value=00>Selecciona oficina</OPTION><OPTION value=47>Murcia - San Pedro del Pinatar</OPTION><OPTION value=48>Murcia - Balsicas</OPTION><OPTION value=49>Murcia - Los Ramos</OPTION>");
                    }
                    else if (this.value == 45) 
                    {
                     $("#car-select-ofi").html("<OPTION value=45 >Pontevedra - Vilagracia</OPTION>");
                    }
                    else 
                    {
                        $("#car-select-ofi").prop('disabled', true);
                        $("#car-select-ofi").html("<OPTION value=0 selected>Oficina</OPTION>");
                    }
// Function to change form action.
    $("#selectPrevLocation").change(function() {
    var selected = $(this).children(":selected").val();
    console.log(selected);
    switch (selected) {
    case "01":
    $("#book-form1").attr('action', '/Alquiler-coches-en-almeria');
   // alert("Form Action is Changed to 'mysql.html'n Press Submit to Confirm");
    break;
    case "02":
    $("#book-form1").attr('action', '/Alquiler-coches-en-almeria-antas');
   // alert("Form Action is Changed to 'oracle.html'n Press Submit to Confirm");
    break;
    case "03":
    $("#book-form1").attr('action', 'Alquiler-coches-en-almeria-el-ejido');
   // alert("Form Action is Changed to 'msaccess.html'n Press Submit to Confirm");
    break;
    case "04":
    $("#book-form1").attr('action', 'Alquiler-coches-en-almeria-roquetas-de-mar');
   // alert("Form Action is Changed to 'msaccess.html'n Press Submit to Confirm");
    break;
    case "05":
    $("#book-form1").attr('action', 'Alquiler-coches-en-barcelona');
   // alert("Form Action is Changed to 'msaccess.html'n Press Submit to Confirm");
    break;
    case "06":
    $("#book-form1").attr('action', 'Alquiler-coches-en-cordoba');
   // alert("Form Action is Changed to 'msaccess.html'n Press Submit to Confirm");
    break;
    case "07":
    $("#book-form1").attr('action', 'Alquiler-coches-en-madrid');
   // alert("Form Action is Changed to 'msaccess.html'n Press Submit to Confirm");
    break;
    case "09":
    $("#book-form1").attr('action', 'Alquiler-coches-en-madrid-san-fernando-de-henares');
   // alert("Form Action is Changed to 'msaccess.html'n Press Submit to Confirm");
    break;
    case "10":
    $("#book-form1").attr('action', 'Alquiler-coches-en-madrid-murcia');
   // alert("Form Action is Changed to 'msaccess.html'n Press Submit to Confirm");
    break;
    case "11":
    $("#book-form1").attr('action', 'Alquiler-coches-en-madrid-sevilla');
   // alert("Form Action is Changed to 'msaccess.html'n Press Submit to Confirm");
    break;
    default:
    $("#book-form1").attr('action', '#');
    }
    });
    // Function For Back Button
    $(".back").click(function() {
    parent.history.back();
    return false;
    });
    
       $("#calendarDown").datepicker({
    minDate:0,
        changeMonth: true,
        changeYear: true,
        numberOfMonths: 1,
        showAnim: "slideDown",
        dateFormat: "yy-mm-dd",
        onClose: function(selectedDate) {
            console.log('datat',selectedDate);
            if($('#tipo_tarifa').val()=="HORA" ){
               $("#calendarUp").datepicker("setDate", selectedDate);
            }else{
               
               $("#calendarUp").datepicker("option", "minDate", selectedDate);
            } 
        }
    });
    $("#calendarUp").datepicker({
        changeMonth: true,
        changeYear: true,
        numberOfMonths: 1,
        showAnim: "slideDown",
        dateFormat: "yy-mm-dd",
        onClose: function(selectedDate) {
            $("#calendarDown").datepicker("option", "maxDate", selectedDate);
        }
    });
 $("#calendarDown1").datepicker({
    minDate:0,
        changeMonth: true,
        changeYear: true,
        numberOfMonths: 1,
        showAnim: "slideDown",
        dateFormat: "yy-mm-dd",
        onClose: function(selectedDate) {
            
            $("#calendarUp1").datepicker("option", "minDate", selectedDate);
        }
    });
    $("#calendarUp1").datepicker({
        changeMonth: true,
        changeYear: true,
        numberOfMonths: 1,
        showAnim: "slideDown",
        dateFormat: "yy-mm-dd",
        onClose: function(selectedDate) {

            $("#calendarDown1").datepicker("option", "maxDate", selectedDate);
        }
    });

     $("#tipo_tarifa").change(function () {
      //  alert('1');
            if($('#tipo_tarifa').val()=="HORA" ){
                $('#car-select option[value="COMERCIAL"]').attr("selected", true);
                    if ( $('#car-select').val()=== 'COMERCIAL' ) {
                        //$("#car-select").empty();
                       // $("#car-select").append('<option value="COMERCIAL" selected="selected">Vehículo comercial</option>');
                        $('#car-select option[value="COMERCIAL"]').attr("selected", true);
                        $('#car-select').attr('disabled', true).siblings().removeAttr('disabled'); 
                        $("#car-select-form").append('<input class="removeInput" type="hidden" name="tipo_vehiculo" value="COMERCIAL" />');
                         $("#book-form").append('<input class="removeInput" type="hidden" name="tipo_vehiculo" value="COMERCIAL" />');

                    }
            }else{
                         $(".removeInput").remove();
                         $('#car-select').attr('disabled', false).siblings().removeAttr('disabled'); 
            }
        });



    $("#tipo_tarifa").change(function () {
        
    	if($('#tipo_tarifa').val()=="HORA" ){
            $("#calendarUp").attr("placeholder", "Fecha").datepicker();
            $("#calendarUp").datepicker("setDate", null);
            $("#calendarDown").attr("placeholder", "Fecha").datepicker();
            $("#calendarDown").datepicker("setDate", null);               
        }else{ 
           $("#calendarUp").attr("placeholder", "Fecha").datepicker();
           $("#calendarUp").datepicker("setDate", null);
           $("#calendarDown").attr("placeholder", "Fecha").datepicker();
           $("#calendarDown").datepicker("setDate", null);
        } 

    });

    
    //ponemos por defecto valores +2 o +4 horas en bonos por horas 
    $("#tipo_tarifa").change(function () {
        if($('#tipo_tarifa').val()=="HORA" ){
            if($("#tipo_tarifa option:selected").attr('data-bono')=='2'){
                $('#selectPrevTime').html('<option value="12:00:00" selected="true">12:00:00</option>');
            } else if($("#tipo_tarifa option:selected").attr('data-bono')=='4'){
                $('#selectPrevTime').html('<option value="14:00:00" selected="true">14:00:00</option>');
            }        
        } else {
            $('#selectPrevTime').html('<option value="10:00:00" selected="true">10:00:00</option>');
        }
    });


    //BONO 2 HORAS
    $("#selectNextTime").change(function () {
      //  alert('1');
        if($('#tipo_tarifa').val()=="HORA" ){
            if($("#tipo_tarifa option:selected").attr('data-bono')=='2'){
	            var today = $("#selectNextTime").val();
	            var nexttime=  addMinutes(today,'120');
	            //forma antigua de sumar 2 horas
	            //$('#selectPrevTime option[value="'+nexttime+'"]').attr("selected", true);
	            $('#selectPrevTime').html('<option value="'+nexttime+'" selected="true">'+nexttime +' </option>');
           		// alert(nexttime);
            } else if($("#tipo_tarifa option:selected").attr('data-bono')=='4'){
                var today = $("#selectNextTime").val();
            	var nexttime=  addMinutes(today,'240');
            	//forma antigua de sumar 4 horas
            	//$('#selectPrevTime option[value="'+nexttime+'"]').attr("selected", true);
            	$('#selectPrevTime').html('<option value="'+nexttime+'" selected="true">'+nexttime +' </option>');
            }
            
        }
    });
    //BONO 4 HORAS
    // $("#selectNextTime").change(function () {
    //   //  alert('1');
    //     if($('#tipo_tarifa').val()=="HORA" ){
    //         if($('^[data-bono="4"]')){
    //         var today = $("#selectNextTime").val();
    //         var nexttime=  addMinutes(today,'240');
    //         $('#selectPrevTime option[value="'+nexttime+'"]').attr("selected", true);
    //        // alert(nexttime);
    //         }
            
    //     }
    // });
});

function addMinutes(time, minsToAdd) {
  function z(n){ return (n<10? '0':'') + n;};
  var bits = time.split(':');
  var mins = bits[0]*60 + +bits[1] + +minsToAdd;

  return z(mins%(24*60)/60 | 0) + ':' + z(mins%60)+':00';  
}
